Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :brands
  resources :items
  
  resources :users, only:[:index, :destroy] do
    collection do
      get 'card_data'
      get 'card_register'
      get 'index'
      get 'logout'
      get 'mypage'
    end
  end

end
