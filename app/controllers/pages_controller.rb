class PagesController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
=======
  skip_before_action :authenticate_user!, only: :confirmation
  def confirmation
>>>>>>> bf095a276ad2de5eb023efe7643ac53ccc50cc85
  end
end
