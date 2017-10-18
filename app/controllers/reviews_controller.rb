class ReviewsController < ApplicationController

  before_action :load_product

  def create
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review has been saved!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix errors"
      render :product_path
    end
  end

  def edit
    @review = @product.reviews.find(params[:id])
  end

  def update
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
    flash[:notice] = "Review has been updated"
    redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix errors"
      render :edit
    end
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
