class User < ActiveRecord::Base
   validates :first_name, presence: true, length: { maximum: 15 }
   validates :last_name, presence: true, length: { maximum: 15 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.{1}[a-z]+\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
   validates :password, presence:true, length: { minimum: 6 }
   has_secure_password 

   def editor? 
     self.role == 'editor' 
   end

   def admin? 
     self.role == 'admin' 
   end
end
