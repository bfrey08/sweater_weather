class Api::V1::UsersController < ApplicationController

  def create

    if params[:password] != params[:password_confirmation]
      render json: { errors: { details: 'Passwords do not match' } }, status: 400
    elsif User.find_by(email: params[:email]) != nil
      render json: { errors: { details: 'User already exists' } }, status: 400
    elsif params[:password] == nil || params[:password_confirmation] == nil || params[:email] == nil
      render json: { errors: { details: 'Required field is missing' } }, status: 400
    else
      @user = User.new(email: params[:email])
      @user.password = params[:password]
      wip = @user.save!
      render json: UsersSerializer.new(@user), status: 201
    end
  end
end
