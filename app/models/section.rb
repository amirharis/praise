class Section < ActiveRecord::Base
  attr_accessible :section_name, :division_id
  belongs_to :division
  has_many :units

  validates :section_name, :presence => {:message => "Nama seksyen perlu diisi" }, 
        :uniqueness => {:message => "Nama seksyen sudah didaftakan" }

  before_save :cap

  def cap
    self.section_name = self.section_name.upcase
  end
end
