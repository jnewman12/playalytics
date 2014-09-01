Rails.application.routes.draw do
  root to: "home#index"

  #auth sign in
  get '/auth/:spotify/callback', to: 'users#spotify_user', via: [:get, :post]

  get '/home', to: 'users#home'

  #test
  get '/search_spotify' => 'users#search_spotify'

  scope :api do
    get "/user(.:format)" => "users#spotify_user"
    get "/music(.:format)" => "users#music"
  end
end
