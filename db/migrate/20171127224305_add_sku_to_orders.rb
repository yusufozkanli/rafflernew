class AddSkuToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :sku, :string
  end
end
