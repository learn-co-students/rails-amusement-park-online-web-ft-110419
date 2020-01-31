class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
        @message = "blah"
    end
end