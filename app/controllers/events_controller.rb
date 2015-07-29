class EventsController < ApplicationController
	before_action :authenticate_host!

	def new
		@events = Event.new
		render("new")
	end

	def create
		@events = Event.new(event_params)
		if @events.save
			redirect_to(host_dashboard_home)
		else
			render("new")
		end
	end

	def event_params
		return params.require(:events).permit(:title, :time, :date, :location, :artist)
	end
end
