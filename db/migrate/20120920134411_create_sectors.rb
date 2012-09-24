class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string 		:sector_name
      t.timestamps
    end
  end
end
