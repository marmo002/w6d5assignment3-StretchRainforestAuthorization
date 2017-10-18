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

  end

  def update

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
