module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.order('label')
        render json: {status: 'SUCCESS', message: 'LOADED ARTICLES', data:categories},status:ok
      end
    end
  end
end
