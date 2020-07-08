class Mechanic < ApplicationRecord
    has_many :issues
    has_many :vehicles through: issues
end
