if @error_object.blank?
	json.status true
	json.user do
		json.id @user.id
		json.first_name @user.first_name
		json.last_name @user.last_name
		json.email @user.email
		json.user_level @user.user_level
	end
else
	json.status false
	json.error_object @error_object
end