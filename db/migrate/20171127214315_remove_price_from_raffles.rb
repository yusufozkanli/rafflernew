class RemovePriceFromRaffles < ActiveRecord::Migration[5.1]
  def change
    remove_column :raffles, :price, :integer
  end
end
