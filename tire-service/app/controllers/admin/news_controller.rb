# frozen_string_literal: true

module Admin
  class NewsController < ApplicationController
    include Admin::Datatable

    load_and_authorize_resource
    skip_load_resource only: :index

    datatable model: News, exclude_attributes: %w[created_at updated_at]

    UPDATE_MODEL_PARAMS = %i[title
                             content].freeze
    MODEL_PARAMS = UPDATE_MODEL_PARAMS

    def create
      @news = model.create(model_params)
      respond_with @news, location: news_index_path
    end

    def update
      @news.update(model_params)
      respond_with @news, location: news_path
    end

    def destroy
      @news.destroy
      redirect_to news_index_path
    end
  end
end
