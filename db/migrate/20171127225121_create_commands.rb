class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.string :state
      t.string :order_sku
      t.monetize :amount, currency: { present: false }
      t.json :payment

      t.timestamps
    end
  end
end
