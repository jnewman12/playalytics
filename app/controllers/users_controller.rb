class UsersController < ApplicationController

	# user's home
	def home
	end

	def spotify_user
		spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
	    spotify_user.to_json
	    redirect_to "/home"
	end

	def music
		@music = RSpotify::Track.search(params[:search])
		render :json => @music
	end

	def show
		
	end

end