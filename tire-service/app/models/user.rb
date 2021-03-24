# frozen_string_literal: true

class User < ApplicationRecord
  def full_name
    "#{first_name}\t#{last_name}\t#{father_name}"
  end
end
