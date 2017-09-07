class AddActivationCheckStringToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activation_check_string, :text
  end
end
