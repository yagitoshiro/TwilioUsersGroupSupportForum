json.extract! question, :id, :title, :body, :user_id, :score, :created_at, :updated_at
json.url question_url(question, format: :json)
