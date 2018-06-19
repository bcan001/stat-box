require "rails_helper"

RSpec.describe "the user clicks on a sport to display the show", :type => :feature do

  before :each do
   	@sport = FactoryBot.create(:sport, name: 'hockey')
   	@league = FactoryBot.create(:league, name: 'NHL', sport: @sport)
   	@team1 = FactoryBot.create(:team, name: 'Philadelphia Flyers', sport: @sport, league: @league)
   	@team2 = FactoryBot.create(:team, name: 'Florida Panthers', sport: @sport, league: @league)
   	@match = FactoryBot.create(:match, sport: @sport, league: @league, team1_id: @team1.id, team2_id: @team2.id, match_datetime: Time.now.to_datetime)
  end

	it "brings the user to the match show page and display the teams when a match is clicked on" do
		# visit sports_path

		# first("##{@league.name}").click
		# expect(page).to have_content @team1.name

		# poltergeist
		# mocha
		# https://eddyerburgh.me/unit-test-vue-components-beginners
		# https://github.com/mplewis/rails-vue-frontend-test-example
	end

  
end
