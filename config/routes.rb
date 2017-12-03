Rails.application.routes.draw do

  get 'subscribe', to: 'subscribe#new'
  post 'subscribe', to: 'subscribe#create'
  get 'created', to: 'subscribe#created'
  get 'confirm/:activation_token', to: 'subscribe#confirm'

  post 'downvote/:answer_id', to: 'answers#downvote'
  post 'upvote/:answer_id', to: 'answers#upvote'

  root to: 'questions#index'

  resources :users
  resources :answers
  resources :questions
  get 'login', to: 'user_session#new'
  post 'login', to: 'user_session#create'
  delete 'logout', to: 'user_session#destroy'

  get 'tags/:tag', to: 'questions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
