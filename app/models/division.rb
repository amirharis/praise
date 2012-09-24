class Division < ActiveRecord::Base
  attr_accessible :division_name, :sector_id
  belongs_to :sector
  has_many :sections
  has_many :units, :through => :sections

  validates :division_name, :presence => {:message => "Nama bahagian perlu diisi" }, 
        :uniqueness => {:message => "Nama bahagian sudah didaftakan" }

  before_save :cap

  def cap
    self.division_name = self.division_name.upcase
  end
end
