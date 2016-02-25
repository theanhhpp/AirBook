class AddPublishedOnFromBooks < ActiveRecord::Migration
  def change
    add_column :books, :published_on, :datetime
  end
end
