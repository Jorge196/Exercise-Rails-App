Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :exercises do  
    resources :exercise_logs, only: [:show, :new]
  end 
  resources :exercise_logs, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:show]
  root 'exercises#index'

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback' => 'sessions#omniauth'
end
