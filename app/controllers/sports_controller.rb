class SportsController < ApplicationController

	def index

		@sports_objects = Sport.includes(:leagues,:matches).all
		@sports = build_sports_hash(@sports_objects)

		if params[:home]
			respond_to do |format|
			  format.js
			end
		else
			respond_to do |format|
			  format.html
			end
		end
	end

	def show
		@sport = Sport.find(params[:id])

		respond_to do |format|
		  format.js # actually means: if the client ask for js -> return file.js
		end
	end

	def build_sports_hash(sports)
		@sports_json = []
		sports.each do |sport|
			sport_json = {}
			sport.attributes.each do |key,val|
				sport_json.merge!(key => val)
			end
			@leagues_json = []
			sport.leagues.each do |league|
				league_json = {}
				league.attributes.each do |key,val|
					league_json.merge!(key => val)
				end
				@leagues_json << league_json
				sport_json.merge!('leagues' => @leagues_json)
				@teams_json = []
				league.teams.each do |team|
					team_json = {}
					team.attributes.each do |key,val|
						team_json.merge!(key => val)
					end
					@teams_json << team_json
					league_json.merge!('teams' => @teams_json)
				end
			end
			@sports_json << sport_json
		end
		@sports_json
	end

end




