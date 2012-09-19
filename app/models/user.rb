class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  #:validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :ic_number, :password, :password_confirmation, :remember_me, :admin_ready_only
  # attr_accessible :title, :body
  validates :ic_number, :presence => {:message => "No. K/P wajib diisi" }, 
  			:uniqueness => {:message => "No K/P sudah didaftar" }

  validates :ic_number, :presence => {:message => "Nama wajib diisi" }

  validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => true, :if => :email_changed?, :message => "Emel telah didaftar"
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?, :message => "Format emel adalah salah"
  validates_presence_of :password, :on=>:create, :message => "Kata laluan perlu diisi"
  validates_confirmation_of :password, :on=>:create, :message => "Kata laluan tidak sama dengan pengesahan kata laluan"
  validates_length_of :password, :within => Devise.password_length, :allow_blank => true, :message => "Kata laluan terlalu pendek (minimum 6)"
  
  before_save :cap

  def cap
  	self.name = self.name.upcase
  end

  def self.search(search, option="1")
	  if search
	  	if option == "1"
	    	where('name LIKE ?', "%#{search}%")
	    elsif option == "2"
	    	where('ic_number LIKE ?', "%#{search}%")
		end
	  else
	    scoped
	  end
  end

end
