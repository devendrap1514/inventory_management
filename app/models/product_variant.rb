class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :cards

  validates :product, presence: true
  validates :length, :width, presence: true
end
