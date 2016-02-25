class LineItemsController < ApplicationController
include CurrentCart
before_action :set_cart, only: [:create]
before_action :set_line_item, only: [:show, :edit, :update, :destroy]
before_action :logged_in_user, only: [:create]


def new
	@line_items = LineItems.new
end

def create
	book = Book.find(params[:book_id])
	@line_items = @cart.add_book(params[:book_id])
	respond_to do |format|
	if @line_items.save
		format.html { redirect_to root_url, @current_item = @line_item}
		format.js {@current_item = @line_item}
		format.json { render action: 'show',status: :created, location: @line_item }
	else
		format.html {render 'new'}
		format.json {render json: @line_item.errors, status: :unprocessable_entity}
	end
end

def destroy
	@cart= Cart.find(params[:cart_id])
	@line_items = LineItems.find(params[:id])
	@line_items.destroy
	redirect_to cart_path(@cart)
end

def line_item_params
	params.require(:line_item).permit(:book_id)
end
end
end
