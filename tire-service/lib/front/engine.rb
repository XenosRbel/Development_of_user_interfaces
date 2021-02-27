# frozen_string_literal: true

module Front
  class Engine < ::Rails::Engine
    isolate_namespace Front
  end
end
