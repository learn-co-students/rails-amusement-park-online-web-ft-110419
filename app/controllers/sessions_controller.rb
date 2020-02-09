class SessionsController < ApplicationController
	def welcome

	end
	def new
		render 'login'

	end

	def create
		user = User.find_by_id(params[:user][:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			@errors = user.errors.full_messages
			render 'login'
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end
end