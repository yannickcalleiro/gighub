class HostController < ApplicationController
	
	def home
		render('dashboard')
	end
end
