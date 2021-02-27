# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        render json: ::Front::Article.all
      end

      def create
        article = ::Front::Article.create(article_params)
        render json: article
      end

      def destroy
        Article.destroy(params[:id])
      end

      def update
        article = ::Front::Article.find(params[:id])
        article.update_attributes(article_params)
        render json: article
      end

      private

      def article_params
        params.require(:article).permit(:id, :title, :text)
      end
    end
  end
end
