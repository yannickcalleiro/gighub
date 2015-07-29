class HostController < ApplicationController
	before_action :authenticate_host!
	
	def home
		render('dashboard')
	end

	def index
		@host = Host.all
	end
	
end
