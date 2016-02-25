class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.string :image_file_name
      t.string :gerne
      t.datetime :publised_on
      t.text :abstract

      t.timestamps null: false
    end
  end
end
