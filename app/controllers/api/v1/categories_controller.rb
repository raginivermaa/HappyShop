module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.order('label')
        render json: @categories, include: params[:include], status: :ok
      end

      def show
        @category = Category.friendly.find(params[:id])
        render json: @category, include: params[:include], status: :ok
      end

    end
  end
end
