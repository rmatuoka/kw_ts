KwTraining::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  
  namespace :admin do
    resources :users
    resources :columnists do      
      resources :articles
    end
    resources :categories
    resources :organizations do
      resources :organization_images
    end
    resources :highlights
    resources :customers
    resources :enterprises do
      resources :portfolios
      
    end
    resources :statics, only: [:index]
    resources :tags
    resources :wikis
    resources :suggestions
    resources :enterprise_rates
    
    root to: 'statics#index'
  end
  
  resources :user_sessions, only: [:create, :new, :destroy]
  resources :users
  resources :searchs
  resources :profiles
  resources :comments do
    member do
      get :deletar
    end
  end
  resources :likes
  resources :blogs
  resources :categorias
  resources :suggestions
  resources :wiki
  resources :eventos
  resources :empresas do
    resources :rates
    member do
      get :tags
      get :filters
    end
  end
  
  resources :sobre
  resources :colunas do
    resources :artigos
  end
  
  resources :homes do
    collection do
      get :register
    end
  end
  
  resources :authentications
  match '/auth/:provider/callback', to: 'authentications#create', via: :all
  
  root to: 'homes#index'  
  
  match 'blog', to: "blogs#index", via: :all
  match 'caixa-de-ideias', to: "suggestions#new", via: :all
  match 'perfil', to: "profiles#index", via: :all
  match 'register', to: "homes#register", via: :all
  match 'login', to: 'user_sessions#new', via: :all  
  match 'logout', to: 'user_sessions#destroy', via: :all
end
