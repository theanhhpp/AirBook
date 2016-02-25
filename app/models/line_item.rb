class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :book
  belongs_to :cart
  def total
  	book.price * quantity
  end
end
