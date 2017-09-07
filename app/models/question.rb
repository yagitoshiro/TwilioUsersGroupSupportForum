class Question < ApplicationRecord
  include Incrementable
  belongs_to :user
  has_many :answers

end
