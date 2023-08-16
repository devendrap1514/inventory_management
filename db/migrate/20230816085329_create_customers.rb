class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false, limit: 2
      t.string :last_name, null: false, limit: 2
      t.string :email, null: false

      t.timestamps
    end
  end
end
