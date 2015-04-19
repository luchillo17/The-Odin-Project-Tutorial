module AuthorSessionsHelper
	def require_login
		if logged_in?
			redirect_back_or_to(articles_path, notice: 'Already logged in.')
		else
			redirect_to(login_path)
		end
	end
end
