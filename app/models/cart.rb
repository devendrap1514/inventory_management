class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product_variant

  validates :quantity, numericality: { in: (1..100) }

  scope :increase_quantity_if_exist_and_save, ->(customer_id, product_variant_id) {
    if exists?(customer_id: customer_id, product_variant_id: product_variant_id)
      @obj = find_by(customer_id: customer_id, product_variant_id: product_variant_id)
      @obj.increment!(:quantity)
    else
      @obj = new(customer_id: customer_id, product_variant_id: product_variant_id, quantity: 1)
      @obj.save
    end
  }
end
