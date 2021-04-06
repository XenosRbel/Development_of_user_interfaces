# frozen_string_literal: true

Cdn::Engine.routes.draw do
  defaults format: :pdf do
    resources :orders, only: %i[index]
  end
end
