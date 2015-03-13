class WelcomeController < ApplicationController
  def index
    @wf = WeatherFetcher.new
    @forecast = @wf.weather["forecast"]["txt_forecast"]["forecastday"]
  end

end
