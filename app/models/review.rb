class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :product

  validates :user, presence: true
  validates :product, presence: true
  validates :description, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }


end
