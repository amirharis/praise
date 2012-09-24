class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer     :section_id
      t.string		:unit_name
      t.timestamps
    end
  end
end
