class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    #for signing up
    @user = User.new(user_params)
    if @user.save
      render json: "You are logged on!" #redirect to app page
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    #redirect to music app
    render json: "You are logged on!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
