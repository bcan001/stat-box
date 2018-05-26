class UserFavorite < ApplicationRecord

	belongs_to :user
	
	# has_many :leagues, primary_key: 'favorite_id', class_name: 'League'
	# has_many :sports, primary_key: 'favorite_id', class_name: 'Sport'



end


