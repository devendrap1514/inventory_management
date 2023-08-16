class Customer < ApplicationRecord
  has_many :carts

  validates :first_name, presence: { message: "First name can't be empty" }
  validates :last_name, presence: { message: "Last name can't be empty" }
  validates :email, presence: true, uniqueness: { case_sensitive: false }  # defualt message will be "Email has already been taken"


end
