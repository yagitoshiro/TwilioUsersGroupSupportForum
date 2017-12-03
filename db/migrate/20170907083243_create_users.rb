class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :password_digest
      t.string :activation_token
      t.boolean :activation_status
      t.boolean :admin
      t.string :name
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
