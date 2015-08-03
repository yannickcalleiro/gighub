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

	def search_artist
		
		render("artist_search")
	end
	def search
		role = params[:request]
    	artists = Artist.where("role LIKE ?", role.downcase)
    	package = []
    	artists.each do |artist|
    		newArtist = {
    			display_name: artist.display_name
    		}
    		package.push(newArtist)
    	end
    	render :json => package
	end

	def select_artist
		redirect_to("break")
	end

	def event_params
		return params.require(:event).permit(:title, :time, :date, :location)
	end
end
