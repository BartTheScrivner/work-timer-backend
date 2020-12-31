class Api::V1::UsersController < ApplicationController
  skip_before_action :logged_in?, only: [:create, :update]
  before_action :find_user, only: [:show, :update]
  
  def index
    users = User.all 
    render json: users
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
      render json: {errors: "OH NO! > o < "}
    end
  end

  def show
    render json: user
  end

  def update
    user.update(user_params)
    render json: user
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation)
  end

  def find_user
    user = User.find(params[:id])
  end
end
