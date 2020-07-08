class VehiclesController < ApplicationController

    def index
        #if !!session
        session[:user_id]
        #byebug
        @vehicles = Vehicle.all   
        #end
    end


    def new
        @vehicle = Vehicle.new
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)
       @vehicle.user_id = session[:user_id]
     if @vehicle.save
      redirect_to vehicle_path(@vehicle)  
     else
        render :show
     end

    end

    def show
        @vehicle = Vehicle.find_by(id: params[:id])
    end



    private

    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :year, :mileage, :wheel_size)
    end

end
