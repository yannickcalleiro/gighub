Rails.application.routes.draw do

  devise_for :artists
  devise_for :hosts

  get 'host/dashboard' => 'host#home' 
  get 'artist/dashboard' => 'artist#home'

  authenticated :artist do
    devise_scope :artists do
      root to: 'artist#home', as: :artist_dashboard_home
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
