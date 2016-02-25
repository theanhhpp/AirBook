class CartsController < ApplicationController
  	before_action :set_cart, only: [:show, :edit, :update, :destroy]
  	before_action :logged_in_user, only: [:create]
  	
	def show
		@cart =Cart.find(params[:id])
	end
	def destroy
		@cart.destroy if @cart.id == session[:cart_id]
		session[:cart_id] = nil
		respond_to do |format|
		format.html { redirect_to shop_url }
		format.json { head :no_content }
	end
	end
end
