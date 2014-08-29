class UsersController < ApplicationController

	# user's home
	def home
	end

	def music
		@music = RSpotify::Track.search([':name'])
		render :json => @music
	end

end