class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  private 
  
  def logged_in?
    !!session[:user_id]
  end

  def current_user 
    User.find_by_id(session[:user_id])
  end
end
