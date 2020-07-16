class SessionsController < ApplicationController
    

    def new
        @user = User.new
        render :login 
    end
    
    def oauth_login
      byebug
      #user = User.find_or_create_by(uid: auth['uid']) do |u|
        #u.password = SecureRandom.hex
        #u.username = auth['info']['email'].split(@).first
        #u.name = auth['info]['name`]
        #u.email = auth['info']['email']
    end
    
    def create
    #if params[:user]
      @user = User.find_by(user_name: params[:user][:user_name])
      if @user && @user.authenticate(params[:user][:password])
        log_in @user
        redirect_to user_path(@user.id)
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
