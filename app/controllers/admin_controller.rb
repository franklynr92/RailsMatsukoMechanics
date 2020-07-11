class AdminController < ApplicationController
    layout "admin"
    def home
    end

    def index
        @mechanic = Mechanic.find_by_id(params[:id])
    end

    def new
        @mechanic = Mechanic.new
        render :new
    end
end
