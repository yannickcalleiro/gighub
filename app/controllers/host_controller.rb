class HostController < ApplicationController
	before_action :authenticate_host!
	
	def home
		@events = Event.all
		render('dashboard')
	end

	def index
		@host = Host.all
	end
	
end
