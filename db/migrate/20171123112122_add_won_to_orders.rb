class AddWonToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :won, :boolean, default: false
  end
end
