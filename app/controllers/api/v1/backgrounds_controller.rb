class Api::V1::BackgroundsController < ApplicationController

  def index
    picture = UnsplashFacade.picture(params[:location])

    render json: PictureSerializer.new(picture)
  end

end
