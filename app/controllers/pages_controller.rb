class PagesController < ApplicationController
 skip_before_action :authenticate_user!, only: [:home, :confirmation, :winners]

  def home
  end

  def confirmation
  end

  def winners
  end
end
