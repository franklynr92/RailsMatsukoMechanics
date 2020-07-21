class UsersController < ApplicationController
    
    def new
        @user = User.new
    end


    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:message] = "Hello NEW User"
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: session[:user_id]) 
        if @user
         render :show
        else 
          flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
    end
    
  

    private

    def user_params
        params.require(:user).permit(:name, :email, :user_name, :password)
    end
    
end
