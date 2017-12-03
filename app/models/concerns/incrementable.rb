module Incrementable
  def increment_atomic(column, num)
    operator = num < 0 ? '-' : '+'
    quoted_column = self.class.connection.quote_column_name(column)
    updates = ["#{quoted_column} = COALESCE(#{quoted_column}, 0) #{operator} #{num.abs}"]
    updates << "#{self.class.connection.quote_column_name(:updated_at)} = now()"
    self.class.unscoped.where(self.class.primary_key => id).update_all updates.join(', ')
    reload
  end

  def upvote
    self.update_score(1)
  end

  def downvote
    self.update_score(-1)
  end

  def permitted?
    User.current_user && User.current_user.id != self.user_id && AnswerVoteUser.where(user_id: self.user_id, answer_id: self.id).empty?
  end

  def update_score(n)
    if permitted?
      answer_vote = AnswerVoteUser.new(user_id: self.user_id, answer_id: self.id)
      answer_vote.with_lock do
        User.find(self.user_id).increment_atomic(:score, n)
        answer_vote.save!
        self.increment_atomic(:score, n)
        self.save!(validate: false)
      end
    end
  end

end
