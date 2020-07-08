class VehiclesController < ApplicationController

    def index
    end

    def new
        @vehicle = Vehicle.new
    end
end
