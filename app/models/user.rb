class User < ApplicationRecord
    has_secure_password

    validates :username, :email, :name, presence: true
    validates :usernme, :email, uniqueness: true
end
