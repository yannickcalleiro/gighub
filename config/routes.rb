Rails.application.routes.draw do

  devise_for :artists, :controllers => {:registrations => "registrations"}
  devise_for :hosts

  get 'host/dashboard' => 'host#home' 
  get 'artists/dashboard' => 'artists#home'


  get '/events/:id/artist_search' => 'events#search_artist'

  get '/search/:role/:price/:hour' => 'events#search'

  post '/events/:event_id/add_artists/:id' => 'events#update'

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
