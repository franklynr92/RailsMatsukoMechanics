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
      if logged_in?
        @vehicle = Vehicle.find_by(id: params[:id])
      else
        flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
    end

    def update
      
      if logged_in?
        @vehicle = Vehicle.find_by(id: params[:id])
        if @vehicle.update(vehicle_params)
        flash[:notice] = "Vehicle Updated"
        redirect_to vehicles_path
        else
          flash[:notice] = "No changes made"
          render :edit
        end
      else
          flash[:notice] = "Please log in"
          redirect_to '/login' 
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
