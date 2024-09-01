Rails.application.routes.draw do
  devise_for :trainers, controllers: {
    sessions: 'trainers/sessions',
    registrations: 'trainers/registrations'
}

  authenticated :trainer do
    root to: 'trainers#index', as: :trainer_root
    
  end
  
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
 
  authenticated :user do
    root to: 'users#index', as: :user_root
  end

  resources :trainers 

  resources :users

  resources :chats, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :new, :create]
  end

  resources :reservations
  
  root 'pages#home'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
