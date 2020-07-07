Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :brands
  resources :items
  resources :users, only:[:index]
  get 'users/card_data'
  get 'users/card_register'
  get 'users/index'
  get 'users/logout'
  get 'users/mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
