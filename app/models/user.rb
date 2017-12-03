class User < ApplicationRecord
  cattr_accessor :current_user

  include Incrementable
  has_secure_password validations: true
  has_many :questions
  has_many :answers
  before_create :generate_token
  before_create :set_activation_status

  after_create :send_activation_mail

  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 100}
  validates :mail, presence: true, uniqueness: true, length: {minimum: 3, maximum: 200}

  def generate_token
    self.activation_token = Digest::SHA1.hexdigest([Time.now, rand].join)[0..40]
  end

  def set_activation_status
    self.activation_status = false
  end

  def send_activation_mail
    begin
      UserMailer.activate(self).deliver_now
    rescue Exception => e
      logger.info(e.inspect)
    end
  end

  def activate!
    # FIXME expiration?
    if self.activation_status == false
      self.activation_status = true
      self.save
    end
  end

end
