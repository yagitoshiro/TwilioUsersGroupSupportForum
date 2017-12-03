class OwnerValidator < ActiveModel::Validator
  def validate(record)
    if User.current_user
      if record.user_id != User.current_user.id
        record.errors.add(:user_id, :not_permitted)
      end
    else
      record.errors.add(:user_id, :not_permitted)
    end
  end
end
