class RidesController < ApplicationController
    def new
        @ride = Ride.new
        @user = current_user
    end

    def create
        @ride = Ride.new(ride_params)
        @ride.save
        @ride.take_ride

        redirect_to user_path(@ride.user)

    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end