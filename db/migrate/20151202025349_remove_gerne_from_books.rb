class RemoveGerneFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :gerne, :string
  end
end
