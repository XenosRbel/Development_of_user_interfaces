# frozen_string_literal: true

Front::Engine.routes.draw do 
  match "/", via: :all, anchor: false, to: ->(_env) { [400, {}, []] }
end
