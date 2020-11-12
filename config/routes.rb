Rails.application.routes.draw do
  resources :exercise_logs
  resources :exercises
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback' => 'sessions#omniauth'
end
