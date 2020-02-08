class AttractionsController < ApplicationController
    before_action :admin, only: [:edit, :update]
    def new
        @attraction = Attraction.new
    end 

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end 

    def index
        @attractions = Attraction.all
    end 

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)

    end 

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end 

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end 

    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
    end 

    def admin
        unless current_user.is_admin?
        flash[:error] = "You must be an admin to access this section"
        redirect_to attractions_path
        end 
    end 

end
