class AddAuthTokenToResetPassword < ActiveRecord::Migration[5.1]
  def change
    add_column :reset_passwords, :auth_token, :string
  end
end
