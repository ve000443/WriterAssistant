class Tag < ActiveRecord::Base
	has_many :tag_relationship, foreign_key: "tag_id", dependent: :destroy
	has_many :appearances, through: :tag_relationship, source: :anecdote
	validates :name, presence: true
end
