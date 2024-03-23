Rails.application.routes.draw do

  #DEVISE
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  #ADMIN
  namespace :admin do
    resources :skus
    resources :products
    resources :users
    root 'dashboard#index', as: :authenticated_root
  end

  #API
  resources :products, controller: 'api/v1/products', as: 'produtos', path: '/produtos'

  root to: 'admin/dashboard#index'
end
