class Team < ApplicationRecord

	has_many :team1s, class_name: 'Team', foreign_key: 'team1_id'
	has_many :team2s, class_name: 'Team', foreign_key: 'team2_id'

	belongs_to :league
	belongs_to :sport

  validates :name, presence: true
	

end

