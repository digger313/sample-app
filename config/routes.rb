Rails.application.routes.draw do
  get 'users/index'
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  root "posts#index"

get "users/new" => "users#new"
post "users/:id" => "users#update"

  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
