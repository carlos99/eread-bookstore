class Book < ActiveRecord::Base
  belongs_to :publisher
  has_many :publications, dependent: :destroy

  validates :title, :isbn, :description, :published_at, :publisher_id,   presence: true
  validates :page_count, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: {greater_than_or_equal_to: 0.0 }
end
