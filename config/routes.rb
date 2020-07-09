Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'orders', to: 'users/registrations#new_order'
    post 'orders', to: 'users/registrations#create_order'
  end
  root to:'items#index'
  resources :brands
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
