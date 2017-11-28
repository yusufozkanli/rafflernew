class PickWinnerJob < ApplicationJob
  queue_as :default


  #### WINNING ALGORITHM #####

  def draw_ticketnumber(raffle)
    raffle_tickets = []
    raffle.status = "Completed"
    raffle.save
    raffle.orders.each do |o|
      o.quantity.times do
        raffle_tickets << o.ticket_number
      end
    end
    x = raffle_tickets.length - 1
    return raffle_tickets[rand(0..x)]
  end


  def update_order(x)
    order = Order.where("ticket_number = '#{x}'").first
    order.won = true
    order.save
    return order
    # The person who has won will receive an email.
  end

  def perform(raffle)
    puts raffle
    puts "Drawing Ticket..."
    ticket_no = draw_ticketnumber(raffle)
    puts "Updating winning order"
    update_order(ticket_no)
  end
end
