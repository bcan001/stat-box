class SportsController < ApplicationController

	def index
		@sports = Sport.all

		# sports
			# leagues
				# matches

	end

	def show
		@sport = Sport.find(params[:id])

		respond_to do |format|
		  format.js # actually means: if the client ask for js -> return file.js
		end
	end

end




