Rails.application.routes.draw do
  resources :cart
  get 'home/index'
  get '/resume', to: 'product#resume'
  get '/historique', to: 'product#past_orders'
  devise_for :users
  root to: "home#index"
  get '/test', to: 'test#test'
  post '/cart/checkout',  to:'cart#checkout'
  get '/empty', to: 'cart#empty'
  get '/show_orders/:id', to: 'product#toggle_past'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :product
  resources :charges
end
