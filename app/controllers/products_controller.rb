class ProductsController < ApplicationController
  before_action :ensured_logged_in, except: [ :index, :show ]
  before_action :load_product, except: [:index, :new, :create ]
  before_action :ensure_user_owns_product, only: [ :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def show
    @review = Review.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

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
    if @product.update(product_params)
      flash[:notice] = "#{@product.name} has been updated"
      redirect_to product_path
    else
      flash[:alert] = "Please fix errors"
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "#{@product.name} was deleted"
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
