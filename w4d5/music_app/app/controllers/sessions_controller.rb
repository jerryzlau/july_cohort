class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    username = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user
      render json: "Welcome back #{@user.email}!"
    else
      flash.now[:errors] ||= []
      flash[:errors] << "Invalid email or password"
      render :new
    end
  end


end
