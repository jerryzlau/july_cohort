class UsersController < ApplicationController

  before_action :require_no_login

  def new
  end

  def create
    # signing up
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
