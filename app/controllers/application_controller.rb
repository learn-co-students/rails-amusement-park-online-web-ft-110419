class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  helper_method :current_user
  
  private
  
  def logged_in?
    return !!session[:user_id]
  end
  
  def current_user
    return @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  
  def verify_user
    redirect_to root_path unless logged_in?
  end
  
end
