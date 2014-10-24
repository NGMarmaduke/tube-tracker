class WelcomeController < ApplicationController
	def index
		@hello = DateTime.now
	end
end
