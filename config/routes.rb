Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  namespace :admin do
    resources :skus
    resources :products
    resources :users

    root 'dashboard#index', as: :authenticated_root
  end
    root to: 'admin/dashboard#index'
end
