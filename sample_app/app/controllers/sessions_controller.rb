class SessionsController < ApplicationController
	before_action only: [:new, :create] { |controller| @title = 'Log in' }

	def new
	end

	def create
		@user = set_user # Instance variable to be able to test in RSpec.
		if @user && @user.authenticate(session_params[:password])
			log_in @user
			session_params[:remember_me] == '1' ? remember(@user) : forget(@user)
			redirect_back_or @user
		else
			flash.now[:danger] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end

	private
			def set_user
				User.find_by(email: session_params[:email].downcase)
			end

			# Never trust parameters from the scary internet, only allow the white list through.
			def session_params
				params.require(:session).permit(:email, :password, :remember_me)
			end
end
