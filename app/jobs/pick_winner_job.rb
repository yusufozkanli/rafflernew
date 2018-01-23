class PickWinnerJob < ApplicationJob
  queue_as :default


  #### WINNING ALGORITHM #####

    def draw_ticketnumber(raffle)
      raffle_tickets = []
      raffle.status = "Completed"
      raffle.save
      raffle.orders.each do |o|
        raffle_tickets << o.ticket_number
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

    def send_raffle_email(user)
      UserMailer.raffle_result_email(user).deliver_later
    end

    def perform(raffle)
      if raffle.available_tickets == 0
        puts raffle
        puts "Drawing Ticket..."
        ticket_no = draw_ticketnumber(raffle)
        puts "Updating winning order"
        update_order(ticket_no)
        redirect_to :back
        # raffle.orders.each do |o|
        #   send_raffle_email(o.user)
        # end
      else
        puts "Incomplete Raffle..."
        raffle.status = "Incomplete Raffle"
        raffle.save
        puts "Raffle marked incomplete..."
        raffle.orders.each do |o|
          o.user.user_tickets += o.quantity
          o.user.save
        end
      end
    end
end
