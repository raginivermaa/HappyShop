class ProductsController < ApplicationController
  def index
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


    @product_search = ProductSearch.new

    @product_search.search(params).sort_by(params[:sort_by])


    @products = @product_search.products.paginate(page: page, per_page: size)
    @categories = Category.all

  end

  def show
    @product = Product.friendly.find(params[:id])
  end

  def edit
    @product = Product.friendly.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Successfully edited & updated category"
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.friendly.find(params[:id])
    if @product.update_attributes(product_params)
      "Successful update"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.friendly.find(params[:id])
    @product.destroy

    redirect_to products_path
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :state, :category_id)
  end

end
