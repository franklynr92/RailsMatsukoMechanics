class IssuesController < ApplicationController
  before_action :log_in, :set_issue
  #make use of before_action
  #review associations
  #use before_action, set_issue, set_vehicle, if logged_in?
    def index
      @issues = Issue.all
    end
    
    def new
      @issue = Issue.new
    end

    def create
      @issue = Issue.new(issue_params)
      if @issue.save
        redirect_to issue_path(@issue)
      else
        flash[:notice]= "Issue didn't save"
        render :new
      end
    end

    def show
      @issue = Issue.find_by(id: params[:id])
    end


    private

    def issue_params
      params.require(:issue).permit(:name_of_your_issue, :date)
    end

    
     
end
