class VehicleIssuesController < ApplicationController
  before_action :log_in,

    def index
      @vehicle = current_user.vehicles.all
      @issues = Issue.all
    end


    def new
        @vehicle_issue = VehicleIssue.new
        @vehicle = Vehicle.find_by(id: params[:vehicle_id])
        @issues = Issue.all
    end

    def create
      @vehicle_issue = VehicleIssue.new(vehicle_issue_params)
      if @vehicle_issue.save
        redirect_to vehicle_issue_path(@vehicle_issue)
      else
        flash[:notice] = "Vehicle Issue was not saved, needs description and an issue"
        @vehicle = Vehicle.find_by(id:@vehicle_issue.vehicle_id)
        render :new
      end
    end

    def show
      @vehicle_issue = VehicleIssue.find_by(id: params[:id])
      @issue = Issue.find_by_id(@vehicle_issue.issue_id)
      @vehicle = Vehicle.find_by_id(@vehicle_issue.vehicle_id)
    end


    private

    def vehicle_issue_params
      params.require(:vehicle_issue).permit(:description_of_issue, :resolved, :issue_id, :vehicle_id)
    end

end
