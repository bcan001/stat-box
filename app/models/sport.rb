class Sport < ApplicationRecord

	has_many :leagues, dependent: :destroy
	has_many :matches

	# belongs_to :user_favorite, primary_key: 'favorite_id', class_name: 'Sport'

end
