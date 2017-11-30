class Question < ApplicationRecord
  include Incrementable
  acts_as_taggable
  belongs_to :user
  has_many :answers

  validates :title, presence: true, length: {maximum: 250, minimum: 3}
  validates :body, presence: true, length: {maximum: 3000, minimum: 3}
  validates :score, numericality: true
  validates :user_id, numericality: { only_integer: true }, presence: true

  def init_score
    self.score = 0
  end

  def set_user(user)
    self.user_id = user.id
  end
end
