# frozen_string_literal: true

Api::Engine.routes.draw do
  namespace :v1, defaults: { format: "json" } do
    resources :orders, only: %i[index]
    resources :masters, only: %i[index]
    resources :services, only: %i[index]
    resources :discounts, only: %i[index]
    resources :news, only: %i[index]
    resources :customers, only: %i[index]
  end
end
