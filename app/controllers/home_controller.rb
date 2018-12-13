class HomeController < ApplicationController
	def index
		if user_signed_in?
  	#UserMailer.welcome_email(current_user).deliver_now!
		end
	end
end


