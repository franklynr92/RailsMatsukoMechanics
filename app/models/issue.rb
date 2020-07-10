class Issue < ApplicationRecord
    belongs_to :mechanic
    belongs_to :vehicle

    validates :description_of_issue, presence: true
end
