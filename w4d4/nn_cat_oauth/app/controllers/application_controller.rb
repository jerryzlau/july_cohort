class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.session_token
  end

  def logged_in?
    !current_user.nil?
  end

  def require_no_login
    redirect_to cats_url if logged_in?
  end

  # private
  #
  # def require_login
  #   unless login_user!
  #     flash:[error] = "You must be logged in to access this section"

end
