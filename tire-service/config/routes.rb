# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine, at: "/api/docs"
  mount Rswag::Ui::Engine, at: "/api/docs"
  mount Admin::Engine, at: "/admin"
  mount Api::Engine, at: "/api"
  mount Front::Engine, at: "/"
end
