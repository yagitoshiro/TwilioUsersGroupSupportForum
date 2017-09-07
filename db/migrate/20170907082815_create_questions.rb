class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
