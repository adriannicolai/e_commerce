class Address < ApplicationRecord
  belongs_to :user

  validates :full_name, :phone_number, :province, :city, :detailed_address, presence: true
  validates_with UserRegistrationValidator
  validates_with NumberOfAddressValidator

  before_validation do
    self.attributes.each do |key, value|
      self.attributes[key] = value.to_s.strip if value.present?
    end
  end
end
