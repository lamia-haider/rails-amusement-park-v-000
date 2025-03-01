class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])

        @ride = Ride.new
        @user = current_user
    
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end
    
    def edit
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.create(user_id: current_user.id, attraction_id: @attraction.id)
    end
    
    def update
        attraction = Attraction.find_by(id: params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
     end
    
    private
    def attraction_params
        params.require(:attraction).permit(
            :name,
            :min_height,
            :tickets,
            :happiness_rating,
            :nausea_ratiing
          )
    end
end
