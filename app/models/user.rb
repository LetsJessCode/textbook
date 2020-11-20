class User < ApplicationRecord
    has_many :assignments
    has_many :courses, through: :assignments

    has_attached_file :avatar, default_url: ':style/default.png', styles: { thumb: "100x100>" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    validates :email, presence: true, uniqueness: true
    has_secure_password
    
    def self.create_from_omniauth(auth)     
       User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|         
            u.first = auth[:info][:first_name]           
            u.last = auth[:info][:last_name]        
            u.email = auth[:info][:email]        
            u.password = SecureRandom.hex(16)       
        end   
    end
end
