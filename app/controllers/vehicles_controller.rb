class VehiclesController < ApplicationController

    def index
        if logged_in?
          @vehicles = Vehicle.all 
        else
          flash[:notice]= "Please log in"
          redirect_to '/login' 
        end 
    end


    def new
        if logged_in?
          @vehicle = Vehicle.new
        else 
          flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
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
        if logged_in?
          @vehicle = Vehicle.find_by(id: params[:id])
        else
          flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
    end

    def edit
        @vehicle = Vehicle.find_by(id: params[:id])
    end

    def update
        @vehicle = Vehicle.find_by(id: params[:id])
        @vehicle.update(vehicle_params)
        flash[:notice] = "Vehicle Updated"
        redirect_to vehicle_path(@vehicle) 
    end

    def destroy
        raise params.inspect
    end

    private

    def vehicle_params
      params.require(:vehicle).permit(:vehicle_name, :make, :model, :year, :mileage, :wheel_size, :color)
    end

end
