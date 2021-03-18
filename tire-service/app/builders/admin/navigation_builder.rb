# frozen_string_literal: true

module Admin
  class NavigationBuilder
    def call
      build
    end

    private

    def build
      Abilities::Admin::MODELS.each_with_object([]) do |item, memo|
        controller_name = item.class_name.pluralize
        memo << { lable: controller_name, model: item }
      end
    end
  end
end
