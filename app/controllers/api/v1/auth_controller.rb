class Api::V1::AuthController < ApplicationController
  skip_before_action :logged_in?, only: [:create]
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: {user, token: encode_token({user_id: user.id})}
    else
      render json: {error: "Invalid email or password"}
    end
  end

end
