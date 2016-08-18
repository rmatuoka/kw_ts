KwTraining::Application.routes.draw do

  namespace :admin do
    resources :organizations
  end
  namespace :admin do
    resources :highlights
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :enterprises
    resources :statics, only: [:index]
    resources :articles

    root to: 'statics#index'
  end
  
  resources :user_sessions, only: [:create, :new, :destroy]
  resources :users
  
  root to: 'homes#index'  
  match 'register', to: "users#new", via: :all
  match 'login', to: 'user_sessions#new', via: :all  
  match 'logout', to: 'user_sessions#destroy', via: :all
end
