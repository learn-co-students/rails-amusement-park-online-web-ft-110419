class RidesController < ApplicationController
  include RidesHelper
  def new
  end

  def create
    redirect_to root_path if !logged_in?
    # ride = Ride.create(ride_params)
    # # if !params[:attraction_id].nil?
      
    # #   @attraction = Attraction.find(params[:attraction_id])
    # #   ride = create_ride(@attraction)
      
    #   redirect_to user_path(ride.user)
    # # else 
    # #   byebug
    # #   redirect_to attractions_path
    # # end

end


  def show
  end
  private

  def ride_params
    params.permit(:user_id,:attraction_id)
  end
  
end
