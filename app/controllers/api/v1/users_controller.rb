class Api::V1::UsersController < ApplicationController

  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: {data: users, message: "Fetched All users"}, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: {errors: user.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def update
    if @user.update(user_params)
      render json: {user: @user, message: "Succesfully updated the user."}, status: :ok
    else
      render json: {errors: @user&.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @user&.destroy
      render json: {message: "User deleted."}, status: :ok
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :name)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
