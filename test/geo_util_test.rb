require 'test_helper'

class TestGeoUtil
  include GeoUtil

  def rows=(rows)
    @rows = rows
  end

  def input_dir
    'test/data'
  end

  def output_dir
    'test/output'
  end
end

describe GeoUtil do
  before do
    @address = %q{
      1600 GRAND AVE
      Saint Paul, MN
      (44.9378926, -93.1690434)
    }

    @geo_util = TestGeoUtil.new
  end

  describe "#extract_latlong" do
    it "extracts latlong when present" do
      res = @geo_util.send(:extract_latlong, @address)
      assert_equal ["44.9378926", "-93.1690434", :extracted], res
    end

    it "strips whitespace" do
      res = @geo_util.send(:extract_latlong, "\n  (44.9378926 ,   -93.1690434)")
      assert_equal ["44.9378926", "-93.1690434", :extracted], res
    end

    it "returns nil when no latlong" do
      res = @geo_util.send(:extract_latlong, "1600 GRAND AVE\nSaint Paul, MN")
      assert_nil res
    end    
  end

  describe "#identify_latlong_colum" do
    it "finds column with latlong data" do
      @geo_util.rows = [["ID", "VAL", "LOCATION", "COUNT"],
                        ["77", "10.0", @address], "42"]
      assert_equal 2, @geo_util.send(:identify_latlong_column)
    end

    it "returns nil when no column with latlong data" do
      @geo_util.rows = [["ID", "VAL", "LOCATION", "COUNT"],
                        ["77", "10.0", "here", "42"]]
      assert_equal nil, @geo_util.send(:identify_latlong_column)
    end
  end

  describe "#load_file" do
    it "loads file" do
      @geo_util.send(:load_file, 'test_Approved_Building_Permits.csv')
    end
  end
end
