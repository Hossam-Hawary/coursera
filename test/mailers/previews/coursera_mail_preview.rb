# Preview all emails at http://localhost:3000/rails/mailers/coursera_mail
class CourseraMailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/coursera_mail/newRegistration
  def newRegistration
    CourseraMail.newRegistration
  end

end
