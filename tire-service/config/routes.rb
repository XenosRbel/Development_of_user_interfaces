# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, class_name: "Admin::User"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get "persons/profile", as: "user_root"
end
