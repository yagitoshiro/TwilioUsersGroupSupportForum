class CreateAnswerVoteUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_vote_users do |t|
      t.integer :answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
