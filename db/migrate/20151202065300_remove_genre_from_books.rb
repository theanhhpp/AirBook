class RemoveGenreFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :genre, :string
  end
end
