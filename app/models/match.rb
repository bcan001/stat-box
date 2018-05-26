class Match < ApplicationRecord

	
	belongs_to :sport
	belongs_to :league
	belongs_to :team1, class_name: 'Team', foreign_key: 'team1_id'
	belongs_to :team2, class_name: 'Team', foreign_key: 'team2_id'

	

end