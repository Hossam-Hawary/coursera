class CourseraMail < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coursera_mail.newRegistration.subject
  #
  def newRegistration(user)
    @greeting = "Hello "+ user.name
    @user = user
    mail to: user.email, subject: 'COURSERA'
  end
end
