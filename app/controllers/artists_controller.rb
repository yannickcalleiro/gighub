class ArtistsController < ApplicationController
	before_action :authenticate_artist!

	def home
		render('dashboard')
	end

	def new
		@artists = Artist.new
		render('new')
	end

	def create
		@artists = Artist.new(event_params)
		if @artists.save
			redirect_to(host_dashboard_path)
		else
			render("new")
		end
	end

	def show
		@artists
	end

	def event_params
		return params.require(:event).permit(:title, :time, :date, :location)
	end
end
