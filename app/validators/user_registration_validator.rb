class UserRegistrationValidator < ActiveModel::Validator
	def validate(record)
		record.attributes.each do |key, value|
			if ["first_name", "last_name", "full_name"].include? key
				record.errors.add(key.intern, "Special Characters are not allowed in #{key}") if validate_name(value)
			end
		end
	end

	# Check if there is a special character present
	def validate_name(name)
		name =~ /[@%^&!"\\\*\.,\-\:?\/\'=`{}()+_\]\|\[\><~;$#0-9]/
	end
end