OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "7c48336da6c849d0b6850f68382ffb11", "358ab892745b44e39539174c88f82c1d", scope: 'playlist-modify-public playlist-modify-private playlist-read-private user-library-modify user-library-read user-read-email'
end