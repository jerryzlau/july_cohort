class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :login?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def login?
    !!current_user
  end

  def require_login
    redirect_to new_session_url unless login?
  end

  def require_moderator
    redirect_to subs_url unless current_user.id == current_sub.moderator_id
  end

  def current_sub
    Sub.find(params[:id])
  end

  def current_post
    Post.find(params[:id])
  end

  def require_author
    redirect_to posts_url unless current_user.id == current_post.author_id
  end

end
