class RafflesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :browse]

  def index
    @raffles = Raffle.where("status = 'active'").last(4)
    @raffles_ending = Raffle.where("status = 'active'" && "end_date >= '#{DateTime.now}'").order(:end_date).first(4)
    won_orders = Order.where(won: true).last(4)
    @orders = won_orders.last(4)
  end

  def show
    @raffle = Raffle.find(params[:id])
    @order = Order.new
    @user = @raffle.user
    @order_winner = Order.where('raffle_id = ? and won = ?', @raffle.id, true)[0]
  end

  def new
    @raffle = Raffle.new
  end

  def browse
    if params[:search]
      @raffles = Raffle.all.where("model iLIKE ?", "%#{params[:search]}%").where("status = 'active'")
    elsif params[:category]
      @raffles = Raffle.all.where(category_name: params[:category]).where("status = 'active'")
    elsif params[:search] && params[:category]
    else
      @raffles = Raffle.where("status = 'active'")
    end
  end

  def create
    @raffle = Raffle.new(raffle_params)
    @raffle.user_id = current_user.id
    @raffle.available_tickets = @raffle.ticket_quantity
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
    @raffle.status = "active"
    if @raffle.save
      redirect_to raffle_path(@raffle)
    else
      render 'edit'
    end
  end


  private

  def raffle_params
  params.require(:raffle).permit(:title, :category_name, :brand, :model, :color, :price, :description, :end_date, :ticket_quantity, :photo)
  end


end
