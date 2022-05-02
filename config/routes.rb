Rails.application.routes.draw do
  get 'orders/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
     resources :products do
    get 'search', on: :collection
  end
  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end

resources :comments

resources :products do
    resources :order_items, only: %i[create update destroy] do
      member do
        get 'add_quantity'
        get 'remove_quantity'
      end
    end
end

  resources :orders, only: %i[create update destroy] do
      member do
        get 'complete'
      end
    end

    resources :orders, only: :show
  root 'pages#home'
end