class Review < ActiveRecord::Base

  belongs_to :product
  has_one :user
  validates :product_id, :user_id, :description, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }

end
