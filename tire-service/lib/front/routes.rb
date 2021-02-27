# frozen_string_literal: true

Front::Engine.routes.draw do
  root "home#index"
  match "/", via: :all, anchor: false, to: ->(_env) { [400, {}, []] }
end
