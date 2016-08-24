KwTraining::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  namespace :admin do
    resources :columnists
    resources :categories
    resources :organizations
    resources :highlights
    resources :customers
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
