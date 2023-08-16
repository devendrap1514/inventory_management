class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.string :brand_name, null:false
      t.references :vendor, foreign_key: true, null: false

      t.timestamps
    end
  end
end
