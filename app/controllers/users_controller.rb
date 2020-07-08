class UsersController < ApplicationController
    #loading the signup form
    def new
        @user = User.new
    end

    #signup
    def create
        @user = User.new(user_params)
        byebug
        if @user.save
            session[:user_id] = @user.id
            redirect_to vehicles_path
        else
            render :new
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:name, :email, :user_name, :password)
    end
    
end
