class AnswerVoteUser < ApplicationRecord
  belongs_to :user
  belongs_to :answer
end
