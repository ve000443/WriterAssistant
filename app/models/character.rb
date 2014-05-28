class Character < ActiveRecord::Base
	has_many :character_relationship, foreign_key: "character_id", dependent: :destroy
	has_many :appearances, through: :character_relationship, source: :scene
	validates :name, presence: true

	def appearing?(scene)
		character_relationship.find_by(scene_id: scene.id)
	end

	def appear!(scene)
		if appearing?(scene)

		else
			relation = character_relationship.new
			relation.scene_id = scene.id
			relation.character_id = self.id
			relation.save
		end
	end

	def disappear!(scene)
		character_relationship.find_by(scene_id: scene.id).destroy
	end

	def firstAppearance()
		appearances = self.appearances.joins(:chapter).order('chapters.number ASC')
		if appearances.any?
			scene = appearances.first
			"First appear in Chapter n° #{Chapter.find(scene.chapter_id).number} : #{Chapter.find(scene.chapter_id).title}"
		else
			"First appear in a scene which doesn't belong to any chapter yet"
		end
	end
end
