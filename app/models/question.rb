class Question < ApplicationRecord
  validates_with OwnerValidator, only: [:update, :destroy]
  include Incrementable
  acts_as_taggable
  belongs_to :user
  has_many :answers

  validates :title, presence: true, length: {maximum: 250, minimum: 3}
  validates :body, presence: true, length: {maximum: 3000, minimum: 3}
  validates :score, numericality: true
  validates :user_id, numericality: { only_integer: true }, presence: true

  before_validation :init_score, on: [:create]
  before_validation :set_user_id, on: [:create, :update]

  def init_score
    self.score = 0 if self.id.nil?
  end

  def set_user_id
    self.user_id = User.current_user.id || nil
  end
end
