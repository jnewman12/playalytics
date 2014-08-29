Rails.application.routes.draw do
  root to: "home#index"

  #auth
  get '/auth/spotify/callback', to: 'sessions#create'

  resources :users

  get '/home', to: 'users#home'

  scope :api do
    get "/create(.:format)" => "sessions#create"
    get "/music(.:format)" => "users#music"
  end
end
