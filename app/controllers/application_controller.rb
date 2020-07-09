class ApplicationController < ActionController::Base
helper_method :current_user
    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def current_mechanic
      @current_mechanic ||= Mechanic.find_by_id(session[:mechanic_id]) if session[:user_id]
    end
end
