class Issue < ApplicationRecord
    belongs_to :mechanic
    belongs_to :vehicle
end
