class RafflesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :browse]

  def index
    @raffles = Raffle.last(3)
    @raffles_ending = Raffle.where("end_date = '#{Date.today}'")
    won_orders = Order.where(won: true)
    @orders = won_orders.last(3)
  end

  def show
    @raffle = Raffle.find(params[:id])
    @order = Order.new
    @user = @raffle.user
  end

  def new
    @raffle = Raffle.new
  end

  def browse
    @raffles = Raffle.all.where("status" == "open")
  end

  def create
    @raffle = Raffle.new(raffle_params)
    @raffle.user_id = current_user.id
    if @raffle.save
      redirect_to raffle_path(@raffle)
    else
      render 'new'
    end
  end

  def edit
    @raffle = Raffle.find(params[:id])
  end

  def update
    @raffle = Raffle.find(params[:id])
    @raffle.update(raffle_params)
    redirect_to raffle_path(@raffle)
  end

  private

  def raffle_params
  params.require(:raffle).permit(:category_name, :brand, :model, :color, :price, :description, :end_date, :ticket_quantity, :photo)
  end

end
