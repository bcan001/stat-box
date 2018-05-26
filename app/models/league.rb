class League < ApplicationRecord

	belongs_to :sport

	belongs_to :user_favorite, primary_key: 'favorite_id', foreign_key: 'id'

	has_many :teams, dependent: :destroy
	has_many :matches
	

  validates :name, presence: true

end