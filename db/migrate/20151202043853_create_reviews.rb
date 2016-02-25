class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :summary
      t.text :comment
      t.references :book, index: true

      t.timestamps null: false
    end
  end
end
