class AddBelongsToToBooks < ActiveRecord::Migration
  def change
  	add_belongs_to(:books, :genre, index: true)
  end
end
