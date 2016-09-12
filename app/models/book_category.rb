class BookCategory < ActiveRecord::Base
  belongs_to :user
  has_many :book_genders, dependent: :destroy
  has_many :books, through: :book_genders

  validates :name, presence: true
end
