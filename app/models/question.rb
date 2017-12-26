# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

	after_create :send_notice

  def init_score
    self.score = 0 if self.id.nil?
  end

  def set_user_id
    self.user_id = User.current_user.id || nil
  end

	def send_notice
		notifier = Slack::Notifier.new(ENV["SLACK_URL"])
    post_data = "サポートフォーラムに投稿がありました（質問）。#{Settings.site_url}questions/#{self.id}"
    notifier.ping(post_data) if Rails.env == 'production'
	end
end
