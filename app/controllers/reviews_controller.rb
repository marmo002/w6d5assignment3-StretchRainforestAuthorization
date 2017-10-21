class ReviewsController < ApplicationController

  before_action :ensured_logged_in, only: [ :create ]
  before_action :load_product
  before_action :load_review, except: [ :create ]
  before_action :ensure_user_owns_review, only: [ :edit, :update, :destroy ]


  def create
    #load_product before_action
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = "Review has been saved!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix errors"
      render :product_path
    end
  end

  def edit
    #load_product before_action
    #load_review before_action
    #ensure_user_owns_review before_action
  end

  def update
    #load_product before_action
    #load_review before_action
    #ensure_user_owns_review before_action

    if @review.update(review_params)
      flash[:notice] = "Review has been updated"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix errors"
      render :edit
    end
  end

  def destroy
    #load_product before_action
    #load_review before_action
    #ensure_user_owns_review before_action
    @review.destroy
    flash[:notice] = "Review was deleted"
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
  def load_review
    @review = @product.reviews.find(params[:id])
  end
end
