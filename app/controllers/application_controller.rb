class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def spotify_user
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  helper_method :spotify_user
end
