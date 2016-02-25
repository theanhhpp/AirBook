class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	
	def add_book (book_id)
		current_item = line_items.find_by(book_id: book_id)
		if current_item 
			current_item.quantity +=1
		else
			current_item = line_items.build(book_id: book_id)
		end
		current_item
	end
	def total_price
		sum=0
		line_items.each do |item|
		sum = sum + item.total
		end
		sum
	end
end
