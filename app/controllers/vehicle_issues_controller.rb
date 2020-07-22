class VehicleIssuesController < ApplicationController

    def index
       
    end


    def new
        if logged_in?
          @vehicle_issue = VehicleIssue.new
        else 
          flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
    end

    def create

     end

    end

    def show
        
    end

    def edit
      if logged_in?
        @vehicle_issue = VehicleIssue.find_by(id: params[:id])
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
      params.require(:vehicle).permit(:description_of_issue, :resolved, :issue_id, :user_id)
    end

end
