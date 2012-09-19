class UserPassword < ActiveRecord::Base
	self.table_name = "users"
	devise :database_authenticatable
	attr_accessor :current_password
	attr_accessible :name, :email, :ic_number, :password, :password_confirmation, :remember_me, :current_password
	validates_presence_of :password, :on=>:update, :message => "Kata laluan perlu diisi"
	validates_confirmation_of :password, :on=>:update, :message => "Kata laluan tidak sama dengan pengesahan kata laluan"
	validates_length_of :password, :within => Devise.password_length, :allow_blank => true, :message => "Kata laluan terlalu pendek (minimum 6)"
	validate :check_current_password

	def check_current_password
		logger.debug self.current_password
		unless self.current_password == "skip"
			unless User.find(self.id).valid_password?(self.current_password)
				errors.add(:captcha, "Kata laluan semasa tidak sah")
			end
		end
	end 
end