module Api
  module V1
    class ProductsController < ApplicationController
      def index
        #@products = Product.order('name').paginate(page: params[:page], per_page: params[:size])
        #paginate json: @products, page: params[:page], per_page: params[:size]
        #ProductSearch.new(params).call
        #
        if params[:page]
          if params[:page] == ""
            page = 1
          else
            page = params[:page]
          end
        else
          page = 1
        end

        if params[:size]
          if params[:size] == ""
            size = 3
          else
            size = params[:size]
          end
        else
          size = 3
        end


        if params[:sort_by]
          if params[:sort_by] == ""
            sort_by = 'name'
          else
            sort_by = params[:sort_by]
          end
        else
          sort_by = 'name'
        end


        @product_search = ProductSearch.new


        @product_search.search(params).sort_by(sort_by)
        @products = @product_search.products.paginate(page: page, per_page: size)

        @categories = Category.all

        render json: @products, include: params[:include], status: :ok

      end

      def show
        @product = Product.friendly.find(params[:id])
        render json: @product, include: params[:include], status: :ok
      end


    end
  end
end
