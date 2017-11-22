class PagesController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
=======
  skip_before_action :authenticate_user!, only: :confirmation
  def confirmation
>>>>>>> bf095a276ad2de5eb023efe7643ac53ccc50cc85
=======
 skip_before_action :authenticate_user!, only: [:home , :confirmation]
    
  def home
  end 

  def confirmation
>>>>>>> 66d67a9e634500ba9c0fe64e68626afe9db00f71
  end
end
