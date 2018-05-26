class League < ApplicationRecord

	belongs_to :sport

	# belongs_to :user_favorite, primary_key: 'favorite_id', class_name: 'League'


	has_many :teams, dependent: :destroy
	has_many :matches
	

end