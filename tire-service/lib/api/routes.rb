# frozen_string_literal: true

Api::Engine.routes.draw do
  namespace :v1 do
    defaults format: "json" do
      resources :configs, only: %i[index]
      resources :articles, only: %i[index create destroy update]
    end
  end
end
