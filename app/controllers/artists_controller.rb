class ArtistsController < ApplicationController
	before_action :authenticate_artist!

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
		render('show')
	end

end
