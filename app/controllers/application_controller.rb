class ApplicationController < ActionController::Base
helper_method :current_user, :current_mechanic, :logged_in?, :log_in, :log_out
    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def current_mechanic
      @current_mechanic ||= Mechanic.find_by_id(session[:mechanic_id]) if session[:mechanic_id]
    end
    #enums for admin, use for devise
    #active admin 
    #join table

    def log_in
      unless logged_in?
        flash[:notice]= "Please log in"
        redirect_to '/login' 
      end
    end

    def logged_in?
      !current_user.nil?
    end

    def log_out
      reset_session
      @current_user = nil
    end

end
