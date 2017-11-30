Rails.application.routes.draw do

  get 'subscribe', to: 'subscribe#new'
  post 'subscribe', to: 'subscribe#create'
  get 'created', to: 'subscribe#created'
  get 'confirm/:activation_token', to: 'subscribe#confirm'

  root to: 'questions#index'

  resources :users
  resources :answers
  resources :questions
  get 'login', to: 'user_session#new'
  post 'login', to: 'user_session#create'
  delete 'logout', to: 'user_session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
