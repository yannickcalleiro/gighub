class EventsController < ApplicationController
	before_action :authenticate_host!

	def new
		@events = Event.new
		@artists = Artist.all
		render("new")
	end

	def create
		@events = Event.new(event_params)
		if @events.save
			redirect_to("/artist_search")
		else
			render("new")
		end
	end

	def edit
		@events = Event.find(params[:id])
		render("edit")
	end

	def search_artist
		render("artist_search")
	end
	def search
		role = params[:role]
		price = params[:price]
		hour = params[:hour]

    	artists = Artist.where("role LIKE ?", role.downcase).where("price<=?", price).where("hour>=?", hour)

    	package = []
    	artists.first(5).each do |artist|
    		newArtist = {
    			display_name: artist.display_name
    		}
    		package.push(newArtist)
    	end
    	render :json => package
	end

	def update
		@events = Event.find(params[:id])
		if @events.update_attributes(event_params)
			redirect_to("/")
		else
			render("new")
		end
	end

	def event_params
		return params.require(:event).permit(:title, :time, :date, :location, :artist)
	end
end
