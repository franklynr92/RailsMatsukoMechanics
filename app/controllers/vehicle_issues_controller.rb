class VehicleIssuesController < ApplicationController

    def index
      if logged_in?
        @vehicle = current_user.vehicles.all
        @issues = Issue.all
      else 
        flash[:notice] = "Please log in"
        redirect_to '/login' 
      end
    end


    def new
        if logged_in?
          #grab the id of the vehicle from the route in the params
          @vehicle_issue = VehicleIssue.new
          @vehicle = Vehicle.find_by(id: params[:vehicle_id])
          @issues = Issue.all
        else 
          flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
    end

    def create
      @vehicle_issue = VehicleIssue.new(vehicle_issue_params)
      if @vehicle_issue.save
        redirect_to vehicle_issue_path(@vehicle_issue)
      else
        flash[:notice] = "issue was not saved"
        render :new
      end
    end

    def show
      @vehicle_issue = VehicleIssue.find_by(id: params[:id])
      @issue = Issue.find_by_id(@vehicle_issue.issue_id)
      @vehicle = Vehicle.find_by_id(@vehicle_issue.vehicle_id)
    end

    def edit
      if logged_in?
        @vehicle_issue = VehicleIssue.update(vehicle_issue_params)
      else
        flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
    end

    def update
      
      if logged_in? #if params[:mechanic] else flash[:notice] = "You must be an admin to update" elsif current_user else flash[:notice] = "this is not your issue"
        @vehicle_issue = VehicleIssue.find_by(id: params[:id])
        if @vehicle_issue.update(vehicle_issue_params)
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


    private

    def vehicle_issue_params
      params.require(:vehicle_issue).permit(:description_of_issue, :resolved, :issue_id, :vehicle_id)
    end

end
