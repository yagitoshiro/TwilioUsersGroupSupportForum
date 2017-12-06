class ResetPassword < ApplicationRecord
  before_save :generate_token
  after_create :notify

  def notify
    user = User.find(self.user_id)
    UserMailer.reset_password(self, user.mail).deliver_now
  end

  def auth
    self.created_at > Time.now - 1.day
  end

  def generate_token
    self.token = SecureRandom.hex(13)
    self.auth_token = SecureRandom.hex(13)
  end
end
