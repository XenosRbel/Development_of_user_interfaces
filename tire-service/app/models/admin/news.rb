# frozen_string_literal: true

module Admin
  class News < ApplicationRecord
    validates :title, :content, presence: true

    pg_search_scope :search, against: %i[id
                                         title
                                         content]
  end
end
