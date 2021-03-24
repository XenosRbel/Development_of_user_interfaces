# frozen_string_literal: true

Admin::Engine.routes.draw do
  devise_for :administrators, class_name: "Admin::Administrator"

  devise_scope :administrator do
    get "/exit" => "/devise/sessions#destroy"
    resources :users
  end

  resources :administators
  resources :users
  resources :orders

  root to: "home#index"
end
