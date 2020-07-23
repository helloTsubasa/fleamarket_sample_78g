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

  resources :items do
    collection do
      get  'get_category_children', defaults: { format: 'json' }
      get  'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get  'get_category_children', defaults: { format: 'json' }
      get  'get_category_grandchildren', defaults: { format: 'json' }
      get  'purchase'
      post 'pay'
      get  'done'
    end

  end

  resources :users, only:[:index,:edit, :update, :destroy] do
    collection do
      get 'logout'
      get 'mypage'
      get 'profile'
      get 'address'
      get 'mail_pass'
      get 'personal_data'
      put 'address'
      patch 'edit'
    end
  end

  resources :cards, only:[:new, :index, :create, :destroy]

end
