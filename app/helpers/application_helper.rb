module ApplicationHelper
  
  def logged_in?
    return !!session[:user_id]
  end
  
  def current_user
    return @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  
end
