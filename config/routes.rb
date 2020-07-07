Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :brands
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
