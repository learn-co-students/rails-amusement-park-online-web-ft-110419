class RidesController < ApplicationController
  include RidesHelper
  def new
  end

  def create
    
    if !params[:id].nil?
      @attraction = Attraction.find(params[:attraction_id])
      create_ride(@attraction)
      redirect_to user_path(current_user)
    else 
      redirect_to attractions_path
    end

end


  def show
  end
  private
  
end
