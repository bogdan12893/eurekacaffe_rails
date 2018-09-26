Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/service', to: 'static_pages#service'
  get '/blog',  to: 'static_pages#blog'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :products
  resources :orders do
    post 'toggle'
  end
  resources :order_items
  resource  :carts, except: [:destroy] do
    delete :empty, on: :collection
  end

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
