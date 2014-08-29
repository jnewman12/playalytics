class SessionsController < ApplicationController

	def create
		@spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
		@spotify_user = User.new
		@spotify_user.to_json
		redirect_to "users#home"
	end

	#sign out
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "Signed out!" 
	end
end