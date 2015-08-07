class ArtistsController < ApplicationController
	before_action :authenticate_artist!, except: [:show]

	def index
		render('dashboard')
	end

	def home
		render('dashboard')
	end

	def edit
	end

	def show
		@artists = Artist.all
		@artist = Artist.find_by_id(params[:id])
		render('show')
	end

	def profile
		@artist = Artist.find_by_id(params[:id])
		render('profile')
	end

end
