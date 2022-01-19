class Api::V1::RoadTripController < ApplicationController

  def create
    params_reject
    if User.exists?(api_key: session_hash[:api_key])
      route = MapquestFacade.directions(session_hash[:origin], session_hash[:destination])

      render json: RoutesSerializer.new(route), status: 201

    else
      render json: { errors: { details: 'Unauthorized' } }, status: 401
    end

  end



private
  def params_reject
    params.reject! {|x| x }
  end
  def session_hash
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
