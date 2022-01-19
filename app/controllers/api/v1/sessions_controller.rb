class Api::V1::SessionsController < ApplicationController


  def create
    params_reject
    @user = User.find_by(email: session_hash[:email])

    if request.body.read.empty?
      render json: { errors: { details: 'JSON body payload is empty' } }, status: 400
    elsif @user.nil?
      render json: { errors: { details: 'Incorrect email or password' } }, status: 400
    elsif @user.password != session_hash[:password]
      render json: { errors: { details: 'Incorrect email or password' } }, status: 400
    elsif @user.password == session_hash[:password]
      render json: UsersSerializer.new(@user), status: 201
    else
      render json: { errors: { details: 'Not really sure what happened, give it another go' } }, status: 400
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
