Rails.application.routes.draw do

  root 'pages#home'

  authenticated :trainer do
    root to: 'trainers#index', as: :trainer_root
    resources :trainers 
  end

  devise_for :trainers, controllers:{
    sessions: 'trainers/sessions',
    registrations: 'trainers/registrations'
  }

  authenticated :user do
    root to: 'users#index', as: :user_root
    resources :users
  end

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
