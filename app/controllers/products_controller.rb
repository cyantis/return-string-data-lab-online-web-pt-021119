class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    @product = Product.find_by_id(params[:id])
    render plain: @product.inventory > 0
  end

  def description
    @product = Product.find_by_id(params[:id])
    render plain: @product.description
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
