class Sector < ActiveRecord::Base
  attr_accessible :sector_name
  #, :dependent => :delete_all, :validate => :false
  # This destroys the associated objects if they are associated with 
  #:dependent => :destroy, deletes them directly from the database if 
  #:dependent => :delete_all, and otherwise sets their foreign keys to NULL.
  #:destroy/:destroy_all The associated objects are destroyed alongside this object by calling their destroy method
  #:delete/:delete_all All associated objects are destroyed immediately without calling their :destroy method
  #:nullify All associated objects' foreign keys are set to NULL without calling their save callbacks
  has_many :divisions
  has_many :sections, :through => :divisions

  validates :sector_name, :presence => {:message => "Nama sektor perlu diisi" }, 
        :uniqueness => {:message => "Nama sektor sudah didaftakan" }

  before_save :cap

  def cap
    self.sector_name = self.sector_name.upcase
  end
end
