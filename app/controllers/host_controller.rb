class HostController < ApplicationController
	before_action :authenticate_host!
	
	def home
		@events = Event.all
		@events = @events.sort_by{|date, name|name}
		render('dashboard')
	end

	def index
		@host = Host.all
	end
	
end
