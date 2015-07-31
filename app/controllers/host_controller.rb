class HostController < ApplicationController
	before_action :authenticate_host!
	
	def home

		@events = Event.new_event_filter.order(date: :asc)

		render('dashboard')
	end

	def index
		@host = Host.all
	end
	
end
