class SessionsController < ApplicationController
    

    def new
        @user = User.new
        render :login 
    end
    
    def oauth_login
        #u.username = auth['info']['email'].split(@).first
    end
    
    def create
    #if params[:user]
      @user = User.find_by(user_name: params[:user][:user_name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
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
