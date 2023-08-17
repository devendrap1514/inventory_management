class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :carts, dependent: :destroy

  validates :product, presence: true
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
end
