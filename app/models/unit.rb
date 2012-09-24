class Unit < ActiveRecord::Base
  attr_accessible :unit_name, :section_id
  belongs_to :section

  validates :unit_name, :presence => {:message => "Nama unit perlu diisi" }, 
        :uniqueness => {:message => "Nama unit sudah didaftakan" }

  before_save :cap

  def cap
    self.unit_name = self.unit_name.upcase
  end
end
