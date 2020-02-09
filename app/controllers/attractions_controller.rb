class AttractionsController < ApplicationController
	require 'pry'
	def index
		@attractions = Attraction.all
		@user = current_user
	end
	def show
		@attraction = Attraction.find_by_id(params[:id])
		@user = current_user
		@ride = Ride.new
		if @attraction
			render 'show'
		else 
			@message = "There is no attraction with that ID."
			@attractions = Attraction.all
			render 'index'
		end
	end
	def edit
		@attraction = find_attraction
		if @attraction
			render 'edit'
		else
			@message = "There is no attraction with that ID."
			render 'index'
		end
	end

	def update 
		@attraction = find_attraction
		if @attraction.update(ok_params)
			redirect_to attraction_path(@attraction)
		else 
			@errors = @attraction.errors.full_messages
			render 'edit'
		end
	end

	def new
		if current_user.admin == true
			@attraction = Attraction.new
			render 'new'
		else 
			@message = "You are not a park owner, so you cannot create new rides"
			@attractions = Attraction.all
			render 'index'
		end
	end

	def create
		@attraction = Attraction.new(ok_params)
		if @attraction.save 
			flash[:success] ="Ride successfully created!"
			redirect_to attraction_path(@attraction)
		else 
			@errors = @attraction.errors.full_messages
			render 'new'
		end
	end



	private
		def find_attraction
			Attraction.find_by_id(params[:id])
		end
		def ok_params
			params.require(:attraction).permit(:min_height, :happiness_rating, :nausea_rating, :tickets, :name)
		end

end