class PagesController < ApplicationController
 skip_before_action :authenticate_user!, only: [:home, :confirmation]

  def home
  end

  def confirmation
  end
end
