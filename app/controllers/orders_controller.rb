class OrdersController < ApplicationController
  before_action :set_raffle

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.raffle_id = @raffle.id
    @order.ticket_number = set_ticket_number
    if @order.save
      redirect_to raffle_path(@raffle)
       flash[:notice] = "Successfully enrolled in the raffle"
    else
      render 'orders/new'
    end
  end


  private

  def order_params
  params.require(:order).permit(:quantity)
  end

  def set_raffle
    @raffle = Raffle.find(params[:raffle_id])
  end

  def set_ticket_number
    ticket_numbers = []
    x = @order.quantity.to_i
    x.times do
      ticket_numbers << 10.times.map{rand(10)}.join
    end
    return ticket_numbers
  end

end
