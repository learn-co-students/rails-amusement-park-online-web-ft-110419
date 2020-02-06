class RidesController < ApplicationController

    def create
        ride = Ride.create(user: current_user, attraction: Attraction.find(params[:id]))
        message = ride.take_ride
            
        redirect_to user_path(current_user), notice: message
    end

end
