class User < ApplicationRecord
  include Incrementable
  has_secure_password
  has_many :questions
  has_many :answers
  before_create :generate_token
  before_create :set_activation_status

  validates :name, presence: true, uniqueness: true, length: {minimum: 6, maximum: 100}
  validates :mail, presence: true, uniqueness: true, length: {minimum: 4, maximum: 20}
  validates :password, presence: true, length: {minimum: 6, maximum: 20}

  def generate_token
    self.activation_token = Digest::SHA1.hexdigest([Time.now, rand].join)[0..40]
    self.activation_check_string = Digest::SHA1.hexdigest(self.activation_token, self.id)[0..40]
  end

  def set_activation_status
    self.activation_status = false
  end

  def self.activate(token, check)
    begin
      user = User.find_by(activation_token: token, activation_check_string: check)
      if user && Digest::SHA1.hexdigest(user.activation_token, user.id)[0..40] == check
        return user
      else
        return nil
      end
    rescue
      return nil
    end
  end

end
