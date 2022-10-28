if @error_object.blank?
	json.user do
		json.status true
		json.id @user.id
		json.first_name @user.first_name
		json.last_name @user.last_name
		json.email @user.email
	end
else
	json.status false
	json.error_object @error_object
end