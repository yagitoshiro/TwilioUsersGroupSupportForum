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

  def update_score(n)
    User.find(self.user_id).increment_atomic(:score, n)
    self.increment_atomic(:score, n)
    self.save
  end

end
