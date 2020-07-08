class User < ApplicationRecord
    has_secure_password
    has_many :vehicles
    has_many :issues through :vehicles

    validates :user_name, :email, :name, presence: true
    validates :user_name, :email, uniqueness: true
end
