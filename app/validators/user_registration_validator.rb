class UserRegistrationValidator < ActiveModel::Validator
	def validate(record)
		record.errors.add(:first_name, "special characters are not allowed in first name") if validate_name(record.first_name)
		record.errors.add(:last_name, "special characters are not allowed in last name") if validate_name(record.last_name)
	end

	# Check if there is a special character present
	def validate_name(name)
		name =~ /[@%^&!"\\\*\.,\-\:?\/\'=`{}()+_\]\|\[\><~;$#0-9]/
	end
end