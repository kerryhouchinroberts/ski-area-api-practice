class WeatherFetcher

  def initialize
    @wu_connection = Faraday.new(:url => 'http://api.wunderground.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def weather
    response = @wu_connection.get do |req|
      req.url "/api/0172a548331646bb/forecast/geolookup/q/autoip.json"
      req.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(response.body)
  end


end
