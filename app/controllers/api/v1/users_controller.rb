class Api::V1::UsersController < ApplicationController

  def create
    user_params_reject
    if  request.body.read.empty?
      render json: { errors: { details: 'JSON body payload is empty' } }, status: 400
    elsif user_hash[:password] != user_hash[:password_confirmation]
      render json: { errors: { details: 'Passwords do not match' } }, status: 400
    elsif User.find_by(email: user_hash[:email]) != nil
      render json: { errors: { details: 'User already exists' } }, status: 400
    elsif user_hash[:password] == nil || user_hash[:password_confirmation] == nil || user_hash[:email] == nil
      render json: { errors: { details: 'Required field is missing' } }, status: 400
    else
      @user = User.new(email: user_hash[:email])
      @user.password = user_hash[:password]
      wip = @user.save!
      render json: UsersSerializer.new(@user), status: 201
    end
  end

  private
    def user_params_reject
      params.reject! {|x| x }
    end
    def user_hash
      JSON.parse(request.body.read, symbolize_names: true)
    end

end
