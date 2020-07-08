class SessionsController < ApplicationController
    

    def new
        @user = User.new
        render :login 
    end
    
    def create
        @user = User.find_by(user_name: params[:user][:user_name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to vehicles_path
        else
            redirect_to '/login' #new
        end
    end
    
    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end
  
end
