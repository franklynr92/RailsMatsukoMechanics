class IssuesController < ApplicationController
  #before_action: logged_in?,
  #make use of before_action
  #review associations
  #use before_action, set_issue, set_vehicle, if logged_in?
    def index
      if logged_in?
       #@unsorted_issues = current_user.user_issues {|ui| Issue.find_by_id(ui.issue_id)} #update associations so we don't have to map them out
        #@issues = @unsorted_issues.sort{|a, b| a.vehicle_id <=> b.vehicle_id }
#an array of elements and i want to iterate 
        @issues = Issue.all
        @vehicle = current_user.vehicles
      else
        flash[:notice]= "Please log in"
        redirect_to '/login' 
      end
    end
    
    def new
      if logged_in?
        @issue = Issue.new
      else
        flash[:notice]= "Please log in"
        redirect_to '/login' 
      end
    end

 #@ui = UserIssue.new 
          #@ui.issue_id = @issue.id
          #@ui.user_id = @current_user.id
          #@ui.save

    def create
      if logged_in?
        @issue = Issue.new(issue_params)
        if @issue.save
          redirect_to issue_path(@issue)
        else
          flash[:notice]= "Issue didn't save"
          render :new
        end
      else
        flash[:notice]= "Please log in"
        redirect_to '/login' 
     end
    end

    def show
      if logged_in?
        @issue = Issue.find_by(id: params[:id])
      else
        flash[:notice] = "Please log in"
        redirect_to '/login'
      end
    end


    private

    def issue_params
      params.require(:issue).permit(:name_of_your_issue, :date)
    end


end
