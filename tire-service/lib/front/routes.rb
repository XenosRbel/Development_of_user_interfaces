# frozen_string_literal: true

Front::Engine.routes.draw do
  get "/order_info", to: "home#order_info"
  root "home#index"
end
