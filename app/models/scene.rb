class Scene < ActiveRecord::Base
	has_many :character_relationship, foreign_key: "scene_id", dependent: :destroy
	has_many :characters, through: :character_relationship, source: :character
end
