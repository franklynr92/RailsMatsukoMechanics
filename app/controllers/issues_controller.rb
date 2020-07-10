class IssuesController < ApplicationController
    def index
      @issue = Issue.all
    end
    
    def new
      @issue = Issue.new
    end

    def create
        @issue = Issue.new(issue_params)
       
       #@issue.user_id = session[:user_id]
     if @issue.save(validate: false)
        
      redirect_to issues_path(@issue)  
     else
        byebug
        render :new
     end

    end

    def show
        @issue = Issue.find_by(id: params[:id])
    end


    private

    def issue_params
      params.require(:issue).permit(:description_of_issue)
    end


end
