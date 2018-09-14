Rails.application.routes.draw do
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
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :products
  resources :users
end
