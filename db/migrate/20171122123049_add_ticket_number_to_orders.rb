class AddTicketNumberToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :ticket_number, :string
  end
end
