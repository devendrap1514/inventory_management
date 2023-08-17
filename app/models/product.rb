class Product < ApplicationRecord
  belongs_to :vendor
  has_many :product_variants, dependent: :destroy

  validates :name, :brand_name, presence: true
  validates :vendor, presence: true

  default_scope { order(:name) }

  scope :search_product, ->(text) {
    ActiveRecord::Base.connection.execute(
      "SELECT pv.id AS 'product variant id', p.name, p.brand_name, pv.length, pv.width FROM products AS p INNER JOIN product_variants AS pv
      ON p.id = pv.product_id WHERE name LIKE '#{text}%'")
  }

end
