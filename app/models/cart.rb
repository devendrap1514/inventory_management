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


  scope :cart_info, -> {
    ActiveRecord::Base.connection.execute(
      "SELECT p.name, p.brand_name, pv.length, pv.width, c.first_name FROM carts INNER JOIN product_variants AS pv
      ON carts.product_variant_id = pv.id INNER JOIN products AS p ON p.id = pv.product_id INNER JOIN customers AS c ON c.id = carts.customer_id")
  }

end
