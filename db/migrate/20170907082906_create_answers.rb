class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :body
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
