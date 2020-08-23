class User < ApplicationRecord
    has_many :assignments
    has_many :courses, through: :assignments
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email
end
