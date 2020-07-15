class Issue < ApplicationRecord
    belongs_to :vehicle
    validates :vehicle_id, :description_of_issue, :date, :title, presence: true
end
