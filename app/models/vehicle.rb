class Vehicle < ApplicationRecord
    belongs_to :user #needs user_id to save to database with belongs_to
    has_many :issues
    has_many :mechanics through :issues
end
