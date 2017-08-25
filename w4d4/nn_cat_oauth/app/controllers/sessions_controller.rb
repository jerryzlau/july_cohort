class SessionsController < ApplicationController

  before_action :require_no_login, only: [:new, :create]

  def new
  end

  def create
    # signing in, create session id
    username = params[:user][:user_name]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user
      @user.reset_session_token!
      login_user!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Invalid username or password"
      render :new
    end
  end

  def destroy
    @current_user = current_user
    if @current_user
      @current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end


end
