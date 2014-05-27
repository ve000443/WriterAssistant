class Character < ActiveRecord::Base
	has_many :character_relationship, foreign_key: "character_id", dependent: :destroy
	has_many :appearances, through: :character_relationship, source: :scene
	validates :name, presence: true

	def appearing?(scene)
		character_relationship.find_by(scene_id: scene.id)
	end

	def appear!(scene)
		relation = character_relationship.new
		relation.scene_id = scene.id
		relation.character_id = self.id
		relation.save
		#character_relationship.create!(scene_id: id, character_id: self.id)
	end

	def disappear!(scene)
		character_relationship.find_by(scene_id: scene.id).destroy
	end
end
