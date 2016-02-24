Rails.application.routes.draw do
  
  devise_for :users
  resources :articles do
  	resources :comments
  end

  get '/users', to: 'users#index'
  root 'articles#index'
end
