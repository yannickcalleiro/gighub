class ArtistController < ApplicationController
	before_action :authenticate_artist!

	def home
		render('dashboard')
	end
end
