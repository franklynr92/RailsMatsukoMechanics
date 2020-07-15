class UsersController < ApplicationController
    #loading the signup form
    def new
        @user = User.new
    end


    #signup
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:message] = "Hello NEW User"
            redirect_to :show
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: session[:user_id]) #it is the first time it is going to the profile
        if @user
         render :show
        else 
          flash[:notice] = "Please log in"
          redirect_to '/login' 
        end
    end
    
    #def show
     #   @user = User.find_by(id: params[:id]) #it is getting the params
    #end
    

    private

    def user_params
        params.require(:user).permit(:name, :email, :user_name, :password)
    end
    
end
