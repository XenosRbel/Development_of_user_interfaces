# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :front do
    get "home/index"
  end

  devise_scope :users do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "front/home#index"
end
