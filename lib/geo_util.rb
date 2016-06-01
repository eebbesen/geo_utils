require "geo_util/version"

module GeoUtil
  LATLONG_REGEX = /\((\d.*)\)/
  
  private

  def extract_latlong(address)
    if address.match(LATLONG_REGEX)
      latlong = address.match(LATLONG_REGEX)[1].tr(' ', '').split(',')
      [latlong[0], latlong[1], :extracted]
    else
      nil
    end
  end
end
