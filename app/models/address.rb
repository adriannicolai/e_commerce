class Address < ApplicationRecord
  belongs_to :user

  validates :full_name, :phone_number, :province, :city, :detailed_address, presence: true
  validates_with UserRegistrationValidator
  validates_with NumberOfAddressValidator

  # Remove whitespace from address fields
  before_validation do
    self.attributes.each do |key, value|
      self.attributes[key] = value.to_s.strip if value.present?
    end
  end

  # Validate the default billing and default address to only be one
  before_create :set_default_billing_and_address
  before_update :set_default_billing_and_address

  def set_default_billing_and_address
    if self.is_billing.nil?
      self.is_billing = false
    else
      Address.where(user_id: self.user_id).update_all(is_billing: false)
    end

    if self.is_default.nil?
      self.is_default = false
    else
      Address.where(user_id: self.user_id).update_all(is_default: false)
    end
  end
end
