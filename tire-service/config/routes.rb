# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'service/index'
  end
  namespace :admin do
    get 'master/index'
  end
  namespace :admin do
    get 'discount/index'
  end
  namespace :admin do
    get 'administrator/index'
  end
  namespace :admin do
    get 'customer/index'
  end
  namespace :front do
    get "home/index"
  end

  mount Admin::Engine, at: "/admin"

  root to: "front/home#index"
end
