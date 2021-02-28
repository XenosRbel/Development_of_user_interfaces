# frozen_string_literal: true

module Admin
  class HomeController < ApplicationController
    def index
      respond_to do |format|
        format.html
        format.json { render(json: fetch_json) }
      end
    end

    private

    def fetch_json
      {
        pages: "decorate_pages(pages)",
        count: "pages.count"
      }
    end
  end
end
