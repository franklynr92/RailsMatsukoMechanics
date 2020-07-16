class IssuesController < ApplicationController
    def index
      if logged_in?
        @unsorted_issues = current_user.user_issues.map {|ui| Issue.find_by_id(ui.issue_id)}
        @issues = @unsorted_issues.sort{|a, b| a.vehicle_id <=> b.vehicle_id }
#an array of elements and i want to iterate 
        @vehicle = current_user.vehicles
      else
        flash[:notice]= "Please log in"
        redirect_to '/login' 
      end
    end
    
    def new
      if logged_in?
        @vehicle = Vehicle.find_by(id: params[:vehicle_id])
        @issue = Issue.new
      else
        flash[:notice]= "Please log in"
        redirect_to '/login' 
      end
    end

    def create
      if logged_in?
        @issue = Issue.new(issue_params)
        if @issue.save
          @ui = UserIssue.new 
          @ui.issue_id = @issue.id
          @ui.user_id = @current_user.id
          @ui.save
          redirect_to issue_path(@issue)
        else
          flash[:notice]= "Issue didn't save"
          render :show
        end
      else
        flash[:notice]= "Please log in"
        redirect_to '/login' 
     end
    end

    def show
      if logged_in?
        @issue = Issue.find_by(id: params[:id])
        @vehicle = Vehicle.find_by_id(@issue.vehicle_id)
      else
        flash[:notice] = "Please log in"
        redirect_to '/login'
      end
    end


    private

    def issue_params
      params.require(:issue).permit(:description_of_issue, :title, :vehicle_id, :date)
    end


end
