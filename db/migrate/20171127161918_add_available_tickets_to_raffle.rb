class AddAvailableTicketsToRaffle < ActiveRecord::Migration[5.1]
  def change
    add_column :raffles, :available_tickets, :integer
  end
end
