class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:winner]
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
      @raffle.available_tickets -= 1
      @raffle.save
      redirect_to raffle_order_confirmation_path(@raffle, @order)
    else
      render 'orders/new'
    end
  end

  def confirmation
    set_order
  end

  def winner
    set_order
  end

  private

  def order_params
  params.require(:order).permit(:quantity)
  end

  def set_raffle
    @raffle = Raffle.find(params[:raffle_id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def set_ticket_number
    ticket_number = 10.times.map{rand(10)}.join
    return ticket_number
  end

end
