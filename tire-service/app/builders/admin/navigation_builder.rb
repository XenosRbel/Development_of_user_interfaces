# frozen_string_literal: true

module Admin
  class NavigationBuilder
    def call(current_ability:)
      build(current_ability)
    end

    private

    def build(current_ability)
      current_ability::MODELS.each_with_object([]) do |item, memo|
        controller_name = item.class_name.pluralize
        memo << { lable: controller_name, model: item }
      end
    end
  end
end
