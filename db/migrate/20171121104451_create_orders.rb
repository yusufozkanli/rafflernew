class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :raffle, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :quantity
      t.integer :total_amount
      t.date :date

      t.timestamps
    end
  end
end
