# == Schema Information
#
# Table name: answer_vote_users
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnswerVoteUser < ApplicationRecord
  belongs_to :user
  belongs_to :answer
end
