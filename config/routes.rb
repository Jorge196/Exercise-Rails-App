Rails.application.routes.draw do
  resources :exercise_logs
  resources :exercises do 
    resources :exercise_logs, only:[:index, :new]
  end 
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  root 'exercises#index'

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback' => 'sessions#omniauth'
end
