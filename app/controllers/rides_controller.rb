class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    msg = @ride.take_ride
    if @ride.save
      redirect_to user_path(current_user), flash: { message: msg }
    end
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
