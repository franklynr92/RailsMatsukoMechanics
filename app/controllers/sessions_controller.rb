class SessionsController < ApplicationController
    

    def new
        @user = User.new
        render :login 
    end
    
    def create
        if params[:user]
        @user = User.find_by(user_name: params[:user][:user_name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            redirect_to '/login' #new
        end
        elsif params[:mechanic]
            @mechanic = Mechanic.find_by(mechanic_name: params[:mechanic][:mechanic_name])
            if @mechanic && @mechanic.authenticate(params[:mechanic][:password])
                session[:mechanic_id] = @mechanic.id
                redirect_to admin_show_mechanic_path(@mechanic.id)
            else
                redirect_to admin_login_path
            end
        end
    end
    
    
    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end
  
end
