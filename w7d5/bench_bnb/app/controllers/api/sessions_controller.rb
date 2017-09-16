class Api::SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      render 'api/users/show'
    else
      flash[:errors] = ['invalid username or password']
      render :new
    end
  end

  def destroy
    if current_user && log_out
      render json: {}
    elsif logged_in?
      render json: ['an error occured logging out'], :status => 404
    end
  end


end
