class User < ApplicationRecord
    has_secure_password
    has_many :vehicles
    has_many :vehicle_issues
    has_many :issues, through: :vehicle_issues
    

    validates :user_name, :email, :name, presence: true
    validates :user_name, :email, uniqueness: true

    
    
end
