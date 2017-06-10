Rails.application.routes.draw do
    root to: 'toppages#index'
    get 'japanmap', to: 'toppages#japanmap'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    get 'signup', to:'users#new'
    resources :users do
      member do
        get :reviews
      end
    end
        
    resources :spas, only: [:show, :new]
    
    get 'search', to: 'search#index'

    resource :reviews, only: [:create, :destroy]
    resources :checks, only: [:create, :destroy]
end
