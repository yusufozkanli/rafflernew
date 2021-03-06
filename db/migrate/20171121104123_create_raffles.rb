class CreateRaffles < ActiveRecord::Migration[5.1]
  def change
    create_table :raffles do |t|
      t.references :user, foreign_key: true
      t.string :category_name
      t.string :brand
      t.string :model
      t.integer :price
      t.string :color
      t.text :description
      t.date :end_date
      t.string :status, :default => "active"
      t.timestamps
    end
  end
end
