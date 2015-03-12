class SkiAreaFetcher

  def initialize
    @ski_data_connection = Faraday.new(:url => 'https://skimap.org') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def ski_area
    response = @ski_data_connection.get do |req|
      req.url "/SkiAreas/view/503.json"
      req.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(response.body)
  end

end
