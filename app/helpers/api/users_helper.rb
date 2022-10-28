module Api::UsersHelper
	def set_user_session(user)
		session[:user_id]    = user.id
		session[:first_name] = user.first_name
		session[:last_name]  = user.last_name
		session[:email]	     = user.email
	end
end
