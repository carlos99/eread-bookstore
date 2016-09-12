class CreateBookGenders < ActiveRecord::Migration
  def change
    create_table :book_genders do |t|
      t.references :book, index: true, foreign_key: true
      t.references :book_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
