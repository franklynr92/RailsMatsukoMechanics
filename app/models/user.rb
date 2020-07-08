class User < ApplicationRecord
    has_secure_password

    validates :user_name, :email, :name, presence: true
    validates :user_name, :email, uniqueness: true
end
