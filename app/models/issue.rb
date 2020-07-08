class Issue < ApplicationRecord
    belongs_to :users
    belongs_to :mechanics
    has_many :vehicles
end
