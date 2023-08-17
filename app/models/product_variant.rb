class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :cards

  validates :product, presence: true, numerically: { only_integer: true }
  validates :length, :width, presence: true, numerically: { only_integer: true }
end
