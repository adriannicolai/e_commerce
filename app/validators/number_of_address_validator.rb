class NumberOfAddressValidator < ActiveModel::Validator
  def validate(record)
    check_number_of_address = check_number_of_address(record.user_id)

    record.errors.add(:address_limit, "Cannot have more than 12 addresses") if check_number_of_address >= 12
  end

  def check_number_of_address(user_id)
    User.find_by(id: user_id).addresses.length
  end
end