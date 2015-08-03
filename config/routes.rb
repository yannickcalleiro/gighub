Rails.application.routes.draw do

  devise_for :artists
  devise_for :hosts

  get 'host/dashboard' => 'host#home' 
  get 'artists/dashboard' => 'artists#home'


  get '/artist_search' => 'events#search_artist'
  get '/search/:request' => 'events#search'
  post '/search' => 'events#select_artist'

  authenticated :artist do
    devise_scope :artists do
      root to: 'artists#home', as: :artist_dashboard_home
    end
  end

  authenticated :host do 
    devise_scope :host do
      root to: 'host#home', as: :host_dashboard_home
    end
  end

  root to: "site#home"

  resources :host, :artists, :events

end
