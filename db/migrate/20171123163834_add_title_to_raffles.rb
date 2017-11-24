class AddTitleToRaffles < ActiveRecord::Migration[5.1]
  def change
    add_column :raffles, :title, :string
  end
end
