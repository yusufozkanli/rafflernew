class AddCommandToOrder < ActiveRecord::Migration[5.1]
  def change
     add_reference :commands, :order, foreign_key: true
  end
end
