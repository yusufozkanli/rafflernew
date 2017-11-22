class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :location, :string
    add_column :users, :photo, :string
  end
end
