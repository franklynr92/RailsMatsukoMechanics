class Issue < ApplicationRecord
    has_many :vehicle_issues
    has_many :vehicles, through: :vehicle_issues
    
    validates :vehicle_id, :description_of_issue, :date, :title, presence: true
    #category change

    
end
