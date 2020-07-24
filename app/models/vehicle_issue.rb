class VehicleIssue < ApplicationRecord
    belongs_to :issue
    belongs_to :vehicle
    
    validates :description_of_issue, presence: true


end