class IssuesController < ApplicationController
    def index
      if logged_in?
        @issue = Issue.all
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

    def create
      if logged_in?
        @issue = Issue.new(issue_params)
        if @issue.save
          redirect_to issues_path(@issue)  
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
      else
        flash[:notice] = "Please log in"
        redirect_to '/login'
      end
    end


    private

    def issue_params
      params.require(:issue).permit(:description_of_issue, :title)
    end


end
