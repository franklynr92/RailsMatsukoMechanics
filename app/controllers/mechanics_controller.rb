class MechanicsController < ApplicationController
    def new  
        @mechanic = Mechanic.new
    end

    def create
        @mechanic = Mechanic.new(mechanic_params)
        if @mechanic.save
            session[:mechanic_id] = @mechanic.id
            redirect_to mechanic_path(@mechanic)
        else
            render :new #new
        end
    end

    def show
        @mechanic = Mechanic.find_by(id: params[:id])
    end

    private

    def mechanic_params
        params.require(:mechanic).permit(:name, :email, :mechanic_name, :password)
    end

end
