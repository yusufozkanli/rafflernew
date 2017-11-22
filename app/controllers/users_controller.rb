class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user

  def show
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
