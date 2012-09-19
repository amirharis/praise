class AddIcNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ic_number, :string
  end
end
