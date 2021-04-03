# frozen_string_literal: true

Api::Engine.routes.draw do
  namespace :v1 do
    defaults format: "json" do
    end
  end
end
