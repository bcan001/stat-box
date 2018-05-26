class Sport < ApplicationRecord

	has_many :leagues, dependent: :destroy
	has_many :matches

	belongs_to :user_favorite, primary_key: 'favorite_id', foreign_key: 'id'

  validates :name, presence: true

end
