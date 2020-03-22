class WeatherController < ApplicationController

  def index
    @data = is_asking? ? Weather::GetWeatherSummary.run!(permit_params) : nil
  end

  private

  def permit_params
    params.permit(:city_id, :provider) if is_asking?
  end

  def is_asking?
    params.has_key?(:city_id) && params[:city_id] != ''
  end
end
