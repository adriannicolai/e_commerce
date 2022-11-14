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
  before_update :check_if_default_address_and_billing_changed

  before_save :titleize_full_name
	before_update :titleize_full_name

	private
	def titleize_full_name
    self.full_name = self.full_name.titleize
	end

  def set_default_billing_and_address
    Address.where(user_id: self.user_id).update_all(is_billing: false) if self.is_billing.present?
    Address.where(user_id: self.user_id).update_all(is_default: false) if self.is_default.present?
  end

  def check_if_default_address_and_billing_changed
    Address.where(user_id: self.user_id).update_all(is_billing: false) if self.is_billing_changed?
    Address.where(user_id: self.user_id).update_all(is_default: false) if self.is_default_changed?
  end

end
