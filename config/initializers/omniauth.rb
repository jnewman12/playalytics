Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "79e4fd1d574549478d00f857af9d4bc6", "c4989f31895d4ffda01f459a46a652e5", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end