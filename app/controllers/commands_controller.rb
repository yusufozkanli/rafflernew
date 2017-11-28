class CommandsController < ApplicationController
  def show
    @command = Command.where(state: 'paid').find(params[:id])
  end

  def create
    order = Order.find(params[:order_id])
    command = Command.create!(order_sku: order.sku, amount: order.price, state: 'pending')

    redirect_to new_command_payment_path(command)
  end

  def create_command
    order = Order.find(params[:order_id])
    command = Command.create!(order_sku: order.sku, amount: order.price, state: 'pending')

    redirect_to new_command_payment_path(command)
  end
end
