# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :front do
    get "home/index"
  end

  mount Admin::Engine, at: "/admin"

  root to: "front/home#index"
end
