class RemovePublisedOnFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :publised_on, :datetime
  end
end
