class HostController < ApplicationController
	before_action :authenticate_host!
	
	def home
		render('dashboard')
	end
end
