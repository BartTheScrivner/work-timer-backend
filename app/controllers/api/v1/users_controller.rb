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
    render json: {user: UserSerializer.new(user).serializable_hash, token: encode_token({user_id: user.id})}
  end

  def query
    headers = request.headers["Authorization"]
    token = headers.split(" ")[1]
    user_id = JWT.decode(token, "fixthis", "HS256")[0]["user_id"]
    if params[:genreFilters].length > 0 || params[:instrumentFilters].length > 0
      genre_filtered_users = User.all.select{ |user| (user.genre_ids & params[:genreFilters]).any? }
      inst_filtered_users = User.all.select{ |user| (user.instrument_ids & params[:instrumentFilters]).any? }
      filtered_users = genre_filtered_users + inst_filtered_users
    else 
      filtered_users = User.all
    end
    render json: filtered_users.select{ |user| user.id != user_id}, only: [:id, :first_name, :last_name, :bio, :img_url], include: [:songs, :genres, :instruments]
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation)
  end

  def find_user
    user = User.find(params[:id])
  end
end
