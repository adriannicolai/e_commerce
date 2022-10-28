module Api::UsersHelper
	def set_user_session(user)
		session[:user]              = {}
		session[:user][:user_id]    = user.id
		session[:user][:first_name] = user.first_name
		session[:user][:last_name]  = user.last_name
		session[:user][:email]	    = user.email
	end
end
