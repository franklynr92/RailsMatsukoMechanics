class Issue < ApplicationRecord
    has_many :vehicle_issues
    has_many :vehicles, through: :vehicle_issues 
    has_many :users, through: :vehicles
    
    
    #category change

    
end
