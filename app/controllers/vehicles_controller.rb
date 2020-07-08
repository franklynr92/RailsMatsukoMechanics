class VehiclesController < ApplicationController

    def index
       # byebug
        @vehicles = Vehicle.find_by(id: params[:id])
    end


    def new
        @vehicle = Vehicle.new
    end

    def create
    @vehicle = Vehicle.new(vehicle_params)
     if @vehicle.save
        #byebug
      redirect_to vehicles_path(@vehicle)  
     else
        render :show
     end
    end

    def show
        @vehicle = Vehicle.find_by(:id)
    end



    private

    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :year, :mileage, :wheel_size)
    end
end
