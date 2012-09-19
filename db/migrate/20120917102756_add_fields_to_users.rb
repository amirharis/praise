class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean, :default => false
  	add_column :users, :admin_read_only, :boolean, :default => false
  	add_column :users, :name, :string
  end
end
