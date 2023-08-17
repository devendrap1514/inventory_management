class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :cards

  validates :product, presence: true
  validates :length, presence: true, numericality: { only_integer: true }
  validates :width, presence: true, numericality: { only_integer: true }
end
