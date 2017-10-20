class SessionsController < ApplicationController

  def new
    #code
  end

  def create
    user = User.find_by( email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_url, notice: "You are Logged in now"
    else
      render :new, notice: "Email and password required"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "You are Logged out"
  end
end
