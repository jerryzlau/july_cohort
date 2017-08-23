class UsersController < ApplicationController
  def index
    render json: user
  end

  def create
    @user = User.new(user_params)
# replace the `user_attributes_here` with the actual attribute keys
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(user_params)
    @user.update_attributes!(user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def new
    User.new(user_params)

  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
