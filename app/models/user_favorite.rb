class UserFavorite < ApplicationRecord

	belongs_to :user
	
	has_one :league, primary_key: 'favorite_id', foreign_key: 'id'
	has_one :sport, primary_key: 'favorite_id', foreign_key: 'id'

  validates :favorite_type, presence: true

end


