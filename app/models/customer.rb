class Customer < ApplicationRecord
  has_many :carts, dependent: :destroy

  validates :first_name, presence: { message: "First name can't be empty" }
  validates :last_name, presence: { message: "Last name can't be empty" }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /^[\w.]+@[a-zA-Z]+\.com$/ }

  before_validation :remove_whitespace

  default_scope { order(:first_name) }

  def remove_whitespace
    self.first_name = self.first_name.strip.squeeze(" ")
    self.last_name = self.last_name.strip.squeeze(" ")
    self.email = self.email.gsub(/\s+/, "")
  end

end
