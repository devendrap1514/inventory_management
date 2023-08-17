class AddQuantityToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :quantity, :integer, default: 0, null: false
  end
end
