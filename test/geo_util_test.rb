require 'test_helper'

class TestGeoUtil
  include GeoUtil
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
end