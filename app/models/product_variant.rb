class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :cards

  validates :product, presence: true, numericality: { only_integer: true }
  validates :length, :width, presence: true, numericality: { only_integer: true }
end
