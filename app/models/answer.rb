# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  body        :text
#  score       :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord

  default_scope {order(score: :desc, created_at: :asc)}

  include Incrementable
  belongs_to :user
  belongs_to :question

  validates :body, presence: true, length: {maximum: 3000, minimum: 3}
  validates :score, numericality: true
  validates :user_id, numericality: { only_integer: true }, presence: true
  validates :question_id, numericality: { only_integer: true }, presence: true
  validates_with OwnerValidator, only: [:update, :destroy]

  before_validation :init_score, on: [:create]
  before_validation :set_user_id, on: [:create]

	after_create :send_notice

  def init_score
    self.score = 0 if self.id.nil?
  end

  def set_user_id
    self.user_id = User.current_user.id || nil
  end

	def send_notice
		UserMailer.notice_answer(self).deliver_now
		notifier = Slack::Notifier.new(ENV["SLACK_URL"])
    post_data = "サポートフォーラムに投稿がありました（回答）。#{Settings.site_url}questions/#{self.question_id}"
    notifier.ping(post_data) if Rails.env == 'production'
	end
end
