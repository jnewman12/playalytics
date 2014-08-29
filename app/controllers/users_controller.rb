class UsersController < ApplicationController

	# user's home
	def home
	end

	def music
		@music = RSpotify::Track.search([':popular'])
		render :json => @music
	end

end