class MechanicsController < ApplicationController
    def new  
        @mechanic = Mechanic.new
    end

end
