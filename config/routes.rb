KwTraining::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  namespace :admin do
    resources :columnists do      
      resources :articles
    end
    resources :categories
    resources :organizations
    resources :highlights
    resources :customers
    resources :enterprises do
      resources :portfolios
    end
    resources :statics, only: [:index]
    resources :tags

    root to: 'statics#index'
  end
  
  resources :user_sessions, only: [:create, :new, :destroy]
  resources :users
  
  root to: 'homes#index'  
  match 'register', to: "users#new", via: :all
  match 'login', to: 'user_sessions#new', via: :all  
  match 'logout', to: 'user_sessions#destroy', via: :all
end
