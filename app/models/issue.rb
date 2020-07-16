class Issue < ApplicationRecord
    belongs_to :vehicle
    has_many :user_issues
    
    validates :vehicle_id, :description_of_issue, :date, :title, presence: true
end
