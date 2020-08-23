class User < ApplicationRecord
    has_many :assignments
    has_many :courses, through: :assignments
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email

    def self.create_from_omniauth(auth)     
       User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|         
            u.first = auth[:info][:first_name]           
            u.last = auth[:info][:last_name]        
            u.email = auth[:info][:email]        
            u.password = SecureRandom.hex(16)       
        end   
    end
end
