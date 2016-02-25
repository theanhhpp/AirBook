class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  def new
	if @cart.line_items.empty?
		flash.now[:error] = "Your cart is empty"
		return
	end
		@order = Order.new(name: current_user.name, email: current_user.email)
  end

  def show
  	@order=Order.find(params[:id])
  	render :layout => 'admin'
  end
  def destroy
  	Order.find(params[:id]).destroy
  	flash[:success] = "Successfully deleted..."
  	redirect_to orders_path
  end
  def create
	@order = Order.new(order_params)
	@order.add_line_items_from_cart(@cart)
	respond_to do |format|
		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			OrderNotifier.received(@order).deliver_now
			format.html { redirect_to root_path, success:
			'Thank you for your order.' }
			format.json { render action: 'show', status: :created,
			location: @order }
		else
			format.html { render action: 'new' }
			format.json { render json: @order.errors,
			status: :unprocessable_entity }
		end
	end
  end
private
def order_params
	params.require(:order).permit(:name,:address,:email,:pay_type)	
end

end
