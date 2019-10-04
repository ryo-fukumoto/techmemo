Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  root 'articles#index'
  
  resources :users

  resources :articles , param: :id do
    resources :comments
  end
  resources :likes
end
