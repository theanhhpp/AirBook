class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
  include SessionsHelper
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in first"
        redirect_to login_url
      end
  end
  def set_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
