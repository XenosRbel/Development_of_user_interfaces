# frozen_string_literal: true

Admin::Engine.routes.draw do
  devise_for :administrators, class_name: "Admin::Administrator"

  devise_scope :administrator do
    get "/exit" => "/devise/sessions#destroy"
    resources :users
  end

  resources :administrators
  resources :customers
  resources :users
  resources :orders
  resources :discounts
  resources :masters
  resources :services

  root to: "home#index"
end
