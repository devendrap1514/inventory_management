class Vendor < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :first_name, presence: { message: "First name can't be empty" }
  validates :last_name, presence: { message: "Last name can't be empty" }
  # defualt message will be "Email has already been taken"
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_validation :strip

  def strip
    self.first_name = self.first_name.strip.squeeze(" ")
    self.last_name = self.last_name.strip.squeeze(" ")
    self.email = self.email.strip.squeeze(" ")
  end

end
