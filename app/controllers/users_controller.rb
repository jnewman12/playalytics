class UsersController < ApplicationController

	# user's home
	def home
	end

	def spotify_user
		@spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
		redirect_to '/home'
	end

	def user_info
		@user_info == @spotify_user
		render :json => @user_info
	end

	def music
		@music = RSpotify::Track.search(params[:search])
		render :json => @music
	end

	def search_spotify(search)
		@search_results = HTTParty.get('https://api.spotify.com/v1/searchq=#{search}')
		respond_to do |format|
			render :json => @search_results
		end
	end

end