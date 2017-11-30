# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/activate
  def activate
    UserMailer.activate
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/activated
  def activated
    UserMailer.activated
  end

end
