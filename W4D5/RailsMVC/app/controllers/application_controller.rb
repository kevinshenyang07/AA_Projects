class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in(user)
    @current_user = user
    session[:session_token] = user.reset_session_token
  end

  def log_out
    current_user.reset_session_token
    session[:session_token] = nil
    @current_user = nil
  end

  def require_logged_in
    redirect_to new_session_url unless current_user
  end

end
