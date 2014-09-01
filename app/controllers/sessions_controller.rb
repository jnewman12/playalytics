class SessionsController < ApplicationController

	def create
		#render :text => "<pre>" + env["omniauth.auth"].to_yaml and return 
		#@spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
		#@spotify_user.to_json
		#session[:user_id] = RSpotify::User.new()
		#redirect_to "/home"
		
	    #auth = request.env["omniauth.auth"]
	    #@spotify_user = RSpotify::User.new(:provider => auth['provider'],
	     #                 :uid => auth['uid'].to_s) || User.create_with_omniauth(auth)
	    #reset_session
	    #session[:user_id] = User.id
		#redirect_to "/home", :notice => "Authenticated!"
		spotify_user = User.from_omniauth
		session[:user_id] = user.id
		redirect_to "/home", :notice => "Signed in!"


	end

	#sign out
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "Signed out!" 
	end
end