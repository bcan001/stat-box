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
				@matches_json = []
				league.matches.each do |match|
					match_json = {}
					match.attributes.each do |key,val|
						match_json.merge!(key => val)
					end
					
					
					# @teams_json = []
					team1_json = {}
					match.team1.attributes.each do |key,val|
						team1_json.merge!(key => val)
					end
					# @teams_json << team1_json
	
					team2_json = {}
					match.team2.attributes.each do |key,val|
						team2_json.merge!(key => val)
					end
					# @teams_json << team2_json
			
					match_json.merge!('team1' => team1_json)
					match_json.merge!('team2' => team2_json)


					@matches_json << match_json

					league_json.merge!('matches' => @matches_json)
				end
			end
			@sports_json << sport_json
		end
		@sports_json
	end

end




