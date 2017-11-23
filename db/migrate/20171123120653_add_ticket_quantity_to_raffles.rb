class AddTicketQuantityToRaffles < ActiveRecord::Migration[5.1]
  def change
    add_column :raffles, :ticket_quantity, :integer
  end
end
