class ReviewsController < ApplicationController
before_action :logged_in_user, only: [:create]  


  def index
    @reviews = @book.reviews.order('created_at desc')
    respond_with @reviews
  end

  def show
    @review = @book.reviews.find(params[:id])
    respond_with @book, @review
  end

  def new
    @review = @book.reviews.new
  end

  def create
  	@book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
      if @review.save
        flash[:success] = 'Thanks for your review!'
        redirect_to @book
      else
        render 'new'
      end
  end

  private

  def review_params
    params.require(:review).permit(:stars, :summary, :comment).merge(name: current_user.name)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
  
end
