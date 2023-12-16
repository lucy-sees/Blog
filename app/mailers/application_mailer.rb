class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(email)
    mail(to: email, subject: 'Welcome to Our Site')
  end
end
