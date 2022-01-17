class ForecastController < ApplicationController

  def index
    coord = MapquestFacade.coordinates(params[:location])
    forecast = OpenweatherFacade.forecast(coord.lattitude, coord.longitude)

    render json: ForecastSerializer.new(forecast)
  end

end
