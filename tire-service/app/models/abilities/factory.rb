# frozen_string_literal: true

module Abilities
  class Factory
    class << self
      def build(user = ::User.new)
        return Ability.new(user) unless user.role_available?

        ability_class_for(user).new(user)
      end

      private

      def ability_class_for(user)
        "Abilities::#{user.role.classify}".constantize
      end
    end
  end
end
