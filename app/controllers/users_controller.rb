class UsersController < ApplicationController

	# user's home
	def home
	end

	def spotify_user
		spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    user = User.new(raw_data: spotify_user.to_hash.to_json)
    user.save!
    session[:user_id] = user.id
    
    puts "------------"
	    puts spotify_user.to_json
      puts "-------------"
	    redirect_to "/home"
	end

	def music
		@music = RSpotify::Track.search(params[:search])
# 		render :js => @music.inspect
	end
  
  def add_to_playlist
    playlist = @spotify_user.playlists.first
    track = RSpotify::Track.find(params[:id])
    playlist.add_tracks!([track])
    render :js => 'alert("done");'
  end

	def show
		
	end

end