class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.integer     :sector_id
      t.string		:division_name
      t.timestamps
    end
  end
end
