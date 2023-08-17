class Vendor < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :first_name, presence: { message: "First name can't be empty" }
  validates :last_name, presence: { message: "Last name can't be empty" }
  # defualt message will be "Email has already been taken"
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /[a-zA-Z]+[0-9]*[a-zA-Z]*@[a-zA-Z]+\.com/ }

  before_validation :remove_whitespace

  def remove_whitespace
    self.first_name = self.first_name.strip.squeeze(" ")
    self.last_name = self.last_name.strip.squeeze(" ")
    self.email = self.email.gsub(/\s+/, "")
  end

end
