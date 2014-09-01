Rails.application.routes.draw do
  root to: "home#index"

  #auth sign in
  get '/auth/:spotify/callback', to: 'users#spotify_user', via: [:get, :post]

  get '/home', to: 'users#home'

  #test
  post '/home' => 'users#music'

  get '/show' => "users#show"

  scope :api do
    get "/user(.:format)" => "users#home"
    get "/music(.:format)" => "users#music"
  end
end
