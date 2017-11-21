class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
  end
end
