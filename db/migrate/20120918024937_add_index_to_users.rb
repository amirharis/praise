class AddIndexToUsers < ActiveRecord::Migration
  def change
     add_index :users, :ic_number, :unique => true
     remove_index :users, :email
  end
end
