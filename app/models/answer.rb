class Answer < ApplicationRecord
  include Incrementable
  belongs_to :user
  belongs_to :question
end
