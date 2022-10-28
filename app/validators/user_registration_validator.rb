class UserRegistrationValidator < ActiveModel::Validator
	def validate(user)
		user.errors.add(:first_name, "special characters are not allowed in first name") if validate_name(user.first_name)
		user.errors.add(:last_name, "special characters are not allowed in last name") if validate_name(user.last_name)
	end

	# Check if there is a special character present
	def validate_name(name)
		name =~ /[@%^&!"\\\*\.,\-\:?\/\'=`{}()+_\]\|\[\><~;$#0-9]/
	end
end