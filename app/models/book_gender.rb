class BookGender < ActiveRecord::Base
  belongs_to :book
  belongs_to :book_category
end
