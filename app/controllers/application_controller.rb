class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end

  # def logged_in?
  #   session[:user_id]
  # end

  # def current_user
  #   session[:user_id]
  # end
end
