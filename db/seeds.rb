# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Vendor.create(first_name: "Prakash", last_name: "Bansal", email: "prakashbansal@gmail.com")
Vendor.create(first_name: "Punit", last_name: "Patel", email: "punitpatel@gmail.com")
Vendor.create(first_name: "Akash", last_name: "Singh", email: "akashsingh@gmail.com")
Vendor.create(first_name: "Diljit", last_name: "Paji", email: "diljitpaji@gmail.com")
Vendor.create(first_name: "Aman", last_name: "Ali", email: "amanali@gmail.com")

p "initialize vendor data"


Customer.create(first_name: "Devendra", last_name: "Patidar", email: "devendrapatidar@gmail.com")
Customer.create(first_name: "Sachin", last_name: "Patidar", email: "sachinpatidar@gmail.com")
Customer.create(first_name: "Hariom", last_name: "Patidar", email: "hariompatidar@gmail.com")
Customer.create(first_name: "Harendra", last_name: "Sisodiya", email: "harendrasisodiya@gmail.com")
Customer.create(first_name: "Sumit", last_name: "Sengar", email: "sumitsengar@gmail.com")

p "initialize customer data"

Product.create(name: "Paper", brand_name: "Classmate", vendor_id: 1)
Product.create(name: "Table", brand_name: "Woodland", vendor_id: 2)
Product.create(name: "Laptop", brand_name: "Asus", vendor_id: 3)
Product.create(name: "Box", brand_name: "Ajanta", vendor_id: 4)
Product.create(name: "Book", brand_name: "Shrinath", vendor_id: 5)

p "initialize product data"

(1..5).each do |i|
  [[4,2], [5,2], [8,4], [20,10], [6,2]].each do |subArr|
    ProductVariant.create(product_id: i, length: subArr[0], width: subArr[1])
  end
end

p "initialize product varient data"


Cart.increase_quantity_if_exist_and_save(customer_id: 1, product_variant_id:1)
Cart.increase_quantity_if_exist_and_save(customer_id: 3, product_variant_id:4)
Cart.increase_quantity_if_exist_and_save(customer_id: 2, product_variant_id:17)
Cart.increase_quantity_if_exist_and_save(customer_id: 1, product_variant_id:1)

p "initialize cart data"
