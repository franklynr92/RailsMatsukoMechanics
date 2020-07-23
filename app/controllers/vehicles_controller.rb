class VehiclesController < ApplicationController
  before_action :log_in

    def index
      @vehicles = Vehicle.all 
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
        flash[:notice] = "Vehicle not saved"
        render :new
     end

    end

    def show
        @vehicle = Vehicle.find_by(id: params[:id])
    end

    def edit
      @vehicle = Vehicle.find_by(id: params[:id])
    end

    def update
        @vehicle = Vehicle.find_by(id: params[:id])
      if @vehicle.update(vehicle_params)
        flash[:notice] = "Vehicle Updated"
        redirect_to vehicles_path
      else
        flash[:notice] = "No changes made"
        render :edit
      end
    end

    def destroy
        Vehicle.find(params[:id]).destroy
        redirect_to vehicles_path
    end

    private

    def vehicle_params
      params.require(:vehicle).permit(:vehicle_name, :make, :model, :year, :mileage, :wheel_size, :color)
    end

end
