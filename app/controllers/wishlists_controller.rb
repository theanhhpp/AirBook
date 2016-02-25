class WishlistsController < ApplicationController
  def show
  	@wishlists=Wishlist.where(user_id: current_user.id)
  end
  def destroy
  	 render plain:(params).inspect
  end
  def create
  	@wishlist.create
  	redirect_to wishlist_path
  end
end
