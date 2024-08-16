Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'

  authenticated :trainer do
    root to: 'trainers#index', as: :trainer_root
    resources :trainers 
  end

  devise_for :trainers, controllers:{
    sessions: 'trainers/sessions',
    registrations: 'trainers/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
