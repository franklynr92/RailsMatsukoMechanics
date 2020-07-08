class Mechanic < ApplicationRecord
    has_secure_password
    has_many :issues
    has_many :vehicles, through: :issues
    validates :mechanic_name, :email, :name, presence: true
    validates :mechanic_name, :email, uniqueness: true
end
