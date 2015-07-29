class EventController < ApplicationController
	before_action :authenticate_host!

	def index
		
	end

	def create
		@events = Events.new(event_params)
		if @events.save
			redirect_to(host_dashboard_home)
		else
			render("create")
		end
	end

	def event_params
		require params.require(:events).permit(:title, :time, :location, :artist )
	end
end
