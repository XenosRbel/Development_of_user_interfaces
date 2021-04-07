# frozen_string_literal: true

Admin::Engine.routes.draw do
  devise_for :administrators, class_name: "Admin::Administrator"

  devise_scope :administrator do
    get "/exit", to: "/devise/sessions#destroy"
  end

  resources :administrators
  resources :customers
  resources :users
  resources :orders
  resources :discounts
  resources :masters
  resources :services
  resources :news
  resources :settings, only: %i[show update]

  root "home#index"
end
