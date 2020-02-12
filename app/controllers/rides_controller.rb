class RidesController < ApplicationController
  before_action :logged_in?
  include RidesHelper
  # def new
  
  # end
  def create
    
    ride = Ride.create(ride_params)
    message = ride.take_ride
    redirect_to user_path(ride.user), flash: { message: message }
    
  end


  private
  def logged_in?
    !!session[:user_id]
end

  def ride_params
    
    params.require(:ride).permit(
    :user_id,
    :attraction_id
    )
end
end
