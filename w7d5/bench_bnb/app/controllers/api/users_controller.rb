class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render :show
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
