class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "#{@product.name} has been saved!"
      redirect_to products_path
    else
      flash[:alert] = "Please fix errors"
      render :new
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
