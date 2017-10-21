class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # PRODUCTS METHODS
  def load_product
    @product = Product.find(params[:id])
  end

  def ensure_user_owns_product
    unless current_user == @product.user
      flash[:alert] = "You are not this product owner"
      redirect_to new_sessions_url
    end
  end

  # REVIEWMETHODS
  def ensure_user_owns_review
    unless @review.user == current_user
      flash[:alert] = "You are not the owener of this review"
      redirect_to new_sessions_url
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensured_logged_in
    unless current_user
      flash[:alert] = "You must be logged in!"
      redirect_to new_sessions_url
    end
  end

  helper_method :current_user
end
