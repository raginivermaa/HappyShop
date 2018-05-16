class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully edited & updated category"
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update_attributes(category_params)
      "Successful update"
    else
      render 'edit'
    end
  end


  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy

    redirect_to variants_path
  end

  private

  def category_params
    params.require(:category).permit(:label, :state, :parent_id)
  end


end
