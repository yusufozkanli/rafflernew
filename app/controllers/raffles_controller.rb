class RafflesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @raffles = Raffle.last(6)
  end

  def show
  end

  def new
    @raffle = Raffle.new
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
  params.require(:raffle).permit(:category_name, :brand, :model, :color, :price, :description, :end_date, :max_ticket, :min_ticket, :photo, :photo_cache)
  end

end
