require "geo_util/version"
require "csv"

module GeoUtil
  LATLONG_REGEX = /\((\d.*)\)/

  private

  def load_file(filename)
    @rows = CSV.readlines "#{input_dir}/#{filename}"
  end

  def write_file(filename, data)
    CSV.open("#{output_dir}/#{filename}", 'w') do |csv|
      data.each do |new_row|
        csv << new_row
      end
    end
  end

  def input_dir
    'input'
  end

  def output_dir
    'output'
  end

  # Assume first row is headers for now
  def identify_latlong_column
    @rows[1].each_with_index do |col, i|
      return i if col.match LATLONG_REGEX
    end
    nil
  end

  def extract_latlong(address)
    if address.match LATLONG_REGEX
      latlong = address.match(LATLONG_REGEX)[1].tr(' ', '').split(',')
      [latlong[0], latlong[1], :extracted]
    else
      nil
    end
  end

end
