# frozen_string_literal: true

Admin::Engine.routes.draw do
  devise_scope :user do
    get "/exit" => "/devise/sessions#destroy"
    get "/login" => "/devise/sessions#new"
    post "/login" => "/devise/sessions#new"
  end

  resources :users
  resources :user_password_reset, only: %i[update edit]

  root "main#index"
end
