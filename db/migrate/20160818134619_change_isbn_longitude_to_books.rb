class ChangeIsbnLongitudeToBooks < ActiveRecord::Migration
  def change
    change_column :books, :isbn, :string, :limit => 20
  end
end
