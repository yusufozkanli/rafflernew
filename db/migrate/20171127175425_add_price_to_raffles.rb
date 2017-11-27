class AddPriceToRaffles < ActiveRecord::Migration[5.1]
  def change
    add_monetize :raffles, :price, currency: { present: false }
  end
end
