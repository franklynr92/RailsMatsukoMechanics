class Issue < ApplicationRecord
    belongs_to :vehicle
    validates :description_of_issue, presence: true

=begin
needs an method with sql that picks the object where the issue.vehicle_id = vehicle.id
i want the vehicle connected to that issue and i want the vehicle name
belongs_to :mechanic, class_name: 'Mechanic', optional: true
=end
end
