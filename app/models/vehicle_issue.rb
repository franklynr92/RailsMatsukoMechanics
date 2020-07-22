class VehicleIssue < ApplicationRecord
    belongs_to :issue
    belongs_to :vehicle
    

    #form with a user submittable attribute
    #access data through associated objects
end