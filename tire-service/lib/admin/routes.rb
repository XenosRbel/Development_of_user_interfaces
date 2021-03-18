# frozen_string_literal: true

Admin::Engine.routes.draw do
  devise_for :users, class_name: "User", module: :devise
  devise_scope :user do
    get "/exit" => "/devise/sessions#destroy"
    get "/login" => "/devise/sessions#new"
    post "/login" => "/devise/sessions#new"
  end

  resources :users
  resources :orders

  root to: "home#index"
end
