class SubscribersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to root_path, notice: "Saved Successfully!"
    else
      redirect_to root_path, notice: "Failed to save"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
