class AddReserveTicketQuantityToRaffles < ActiveRecord::Migration[5.1]
  def change
    add_column :raffles, :reserve_ticket_quantity, :integer
  end
end
