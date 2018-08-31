Rails.application.routes.draw do
  root 'static_pages#home'
  resources :products
  get '/index', to: 'products#index'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/service', to: 'static_pages#service'
  get '/blog',  to: 'static_pages#blog'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
