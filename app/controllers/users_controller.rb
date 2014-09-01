class UsersController < ApplicationController

	# user's home
	def home
		@spotify_user = spotify_user
		render :json => @spotify_user
	end

	def spotify_user
		@spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
	    redirect_to "/home"
	end

	def user_info
		@user_info == @spotify_user
		render :json => @user_info
	end

	def music
		@music = RSpotify::Track.search(params[:search])
		render :json => @music
	end

end