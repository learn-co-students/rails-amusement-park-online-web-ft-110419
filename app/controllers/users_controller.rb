class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.new(ok_params)
		if user.save 
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			render 'new'
		end
	end

	def show
		if session[:user_id]
			@user = current_user
		else 
			redirect_to root_path
		end
	end

	def edit 
		@user = find_user
	end

	def update
		@user = find_user
		@user.update(ok_params)
		redirect_to user_path(@user)
	end

	private 
		def ok_params
			params.require(:user).permit(:name, :happiness, :nausea, :admin, :password, :tickets, :add_tickets, :height)
		end
		def find_user
			User.find_by_id(params[:id])
		end


end