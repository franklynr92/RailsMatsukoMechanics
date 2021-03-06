class SessionsController < ApplicationController
  

    def new
        @user = User.new
        render :login 
    end
    
    
    def create
      @user = User.find_by(user_name: params[:user][:user_name])
      if @user && @user.authenticate(params[:user][:password])
        log_in @user
        redirect_to user_path @user.id
      else
        flash[:notice] = "Username/Password incorrect"
        redirect_to '/login' 
      end
    end
    
    
    def home
    end

    def destroy
        log_out
        flash[:notice] = "You have logged out"
        redirect_to root_url
    end

   
  
end
