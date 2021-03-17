# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :front do
    get "home/index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Admin::Engine, at: "/admin"

  root to: "front/home#index"
end
