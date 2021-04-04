# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include PgSearch::Model
  self.abstract_class = true
end
