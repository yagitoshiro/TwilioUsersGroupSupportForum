json.extract! user, :id, :mail, :activation_token, :activation_status, :admin, :name, :score, :created_at, :updated_at
json.url user_url(user, format: :json)
