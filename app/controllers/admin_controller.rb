class AdminController < ApplicationController
	before_action :admin_user, only:[:index, :user, :book, :order, :review]
  def review
    @reviews=Review.all
  end
  def index
 	render :layout => "admin"
  end
  def user
  	render :layout => "admin"
  	@users=User.all
  end
  def book
  	render :layout => 'admin'
  	@books=Book.all
  end
  def order
  	render :layout => 'admin'
  end
   def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
