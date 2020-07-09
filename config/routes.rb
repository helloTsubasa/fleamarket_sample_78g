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
      get 'profile'
      get 'address'
      get 'mail_pass'
      get 'personal_data'
    end
  end

end
