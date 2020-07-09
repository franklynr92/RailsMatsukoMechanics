class MechanicsController < ApplicationController
    def new  
        @mechanic = Mechanic.new
    end

    def create
        @mechanic = Mechanic.find_by(mechanic_name: params[:mechanic][:mechanic_name])
        if @mechanic && @mechanic.authenticate(params[:mechanic][:password])
            session[:mechanic_id] = @mechanic.id
            redirect_to '/profile'
        else
            redirect_to '/login' #new
        end
    end

end
