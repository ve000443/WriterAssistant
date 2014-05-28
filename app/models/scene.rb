class Scene < ActiveRecord::Base
	belongs_to :chapter
	#default_scope -> { joins(:chapter).order('chapters.number ASC') } 

	scope :chapter_number, -> { joins(:chapter).order('chapters.number ASC') }

	has_many :character_relationship, foreign_key: "scene_id", dependent: :destroy
	has_many :characters, through: :character_relationship, source: :character
end
