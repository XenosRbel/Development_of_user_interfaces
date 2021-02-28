# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :frontend do
    get 'home/create'
    get 'home/update'
    get 'home/destroy'
    get 'home/edit'
    get 'home/index'
  end
  devise_for :users, class_name: "::User", module: :devise

  if Rails.env.development?
    mount Rswag::Api::Engine, at: "/api/docs"
    mount Rswag::Ui::Engine, at: "/api/docs"
  end

  mount Admin::Engine, at: "/admin"
  mount Api::Engine, at: "/api"
  mount Frontend::Engine, at: "/"
end
