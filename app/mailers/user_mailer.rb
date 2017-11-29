class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail(to: @user.email, subject: "Welcome to Raffler")
  end

  def raffle_result_email(user)
    @user = user
    mail(to: user.email, subject: "Check your raffle results!")
  end

end
