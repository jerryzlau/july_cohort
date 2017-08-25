class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    #for signing up

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
