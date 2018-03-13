class PaymentsController < ApplicationController
  before_action :set_command

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @command.amount_cents,
    description:  "Payment for ticket #{@command.order_sku} for command #{@command.id}",
    currency:     @command.amount.currency
  )

  @command.update(payment: charge.to_json, state: 'paid')
  redirect_to raffle_order_confirmation_path(@command.order.raffle, @command.order)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_command_payment_path(@command)
end

private

  def set_command
    @command = Command.where(state: 'pending').find(params[:command_id])
  end
end
