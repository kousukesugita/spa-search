Rails.application.routes.draw do
    root to: 'toppages#index'
    get 'japanmap', to: 'toppages#japanmap'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    get 'signup', to:'users#new'
    resources :users
    
    resources :spas, only: [:show, :new]

    get 'search', to: 'search#index'

    resources :reviews, only: [:create, :destroy]
    resources :checks, only: [:create, :destroy]
end