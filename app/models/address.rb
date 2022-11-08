class Address < ApplicationRecord
  belongs_to :user

  validates :full_name, :phone_number, :province, :city, :detailed_address, presence: true
  validates_with UserRegistrationValidator
  validates_with NumberOfAddressValidator
end
