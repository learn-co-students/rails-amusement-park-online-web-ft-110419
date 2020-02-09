require 'pry'
class RidesController < ApplicationController
	def create
		ride = Ride.new(params.require(:ride).permit(:user_id, :attraction_id))
		message = ride.take_ride
		if message == ""
			ride.save
			flash[:success] = "Thanks for riding the #{Attraction.find_by_id(ride.attraction_id).name}!"
			redirect_to user_path(ride.user_id)
		else
			flash[:alert] = message
			redirect_to user_path(ride.user_id)
			# @message = message
			# @attractions = Attraction.all
			# render 'attractions/index'
		end
	end
	
end