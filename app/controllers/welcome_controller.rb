class WelcomeController < ApplicationController
	def index
		@lines = Line.all.order(name: :asc).order(status_description: :desc)
	end
end
