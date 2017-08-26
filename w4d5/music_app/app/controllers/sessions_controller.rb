class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    username = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] ||= []
      flash[:errors] << "Invalid email or password"
      render :new
    end
  end

  def destroy
    log_out_user!
    render :new
  end


end
