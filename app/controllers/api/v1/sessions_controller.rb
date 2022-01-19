class Api::V1::SessionsController < ApplicationController


  def create
    @user = User.find_by(email: params[:email])
    if @user.password == params[:password]
      give_token
    else
      render json: { errors: { details: 'Incorrect password' } }, status: 400
  end


end
