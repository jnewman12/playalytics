class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActionView::Helpers::OutputSafetyHelper
  protect_from_forgery with: :exception

  before_action :login_spotify_user

private

  def login_spotify_user
    unless session[:user_id]
      # redirect ... login ...
      return nil
    end
    @user = User.find(session[:user_id])
    @spotify_user = RSpotify::User.new(JSON.parse(@user.raw_data))
  end

end
