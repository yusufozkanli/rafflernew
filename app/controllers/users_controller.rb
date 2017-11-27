require 'pry'
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user

  def show
    raffles_to_display = []

    if params[:tab] == "participant"
      @user.orders.each do |order|
        order.raffle.user_id != @user.id ? raffles_to_display << order.raffle : nil
      end
    elsif params[:tab] == "organiser"
      @user.orders.each do |order|
        order.raffle.user_id == @user.id ? raffles_to_display << order.raffle : nil
        end
    end
    @raffles = raffles_to_display
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
