Rails.application.routes.draw do
  root to: "tasks#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "login", to: "tasks#index"
  resources :tasks
  resources :users, only: [:index, :show, :new, :create]

end
