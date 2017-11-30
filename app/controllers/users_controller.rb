require 'pry'
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user

  def show
    raffles_to_display = []

    if params[:tab] == "Participant"
      @user.orders.each do |order|
        order.raffle.user_id != @user.id ? raffles_to_display << order.raffle : nil
      end
    elsif params[:tab] == "Organiser"
      raffles_to_display = @user.raffles
    end
    @raffles = raffles_to_display
    @raffles_pending = filter_by_active(raffles_to_display)
    @raffles_past = filter_by_past(raffles_to_display)
  end

  def filter_by_active(raffles)
    active_raffles = []
    raffles.each do |raffle|
      raffle.status == "active" ? active_raffles << raffle : nil
    end
    return active_raffles
  end

  def filter_by_past(raffles)
    past_raffles = []
    raffles.each do |raffle|
      raffle.status != "active" ? past_raffles << raffle : nil
    end
    return past_raffles
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def user_params
  params.require(:user).permit(:name, :location, :email, :facebook, :instagram, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
