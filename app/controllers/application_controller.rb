class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensured_logged_in
    unless current_user
      flash[:alert] = "You must be logged in!"
      redirect_to new_sessions_url
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
