class Anecdote < ActiveRecord::Base
  belongs_to :chapter
	has_many :tag_relationship, foreign_key: "anecdote_id", dependent: :destroy
	has_many :tags, through: :tag_relationship, source: :tag

	def tagged?(tag)
		tag_relationship.find_by(tag_id: tag.id)
	end

	def tag!(tag)
		if tagged?(tag)

		else
			relation = tag_relationship.new
			relation.tag_id = tag.id
			relation.anecdote_id = self.id
			relation.save
		end
	end

	def untag!(tag)
		tag_relationship.find_by(tag_id: tag.id).destroy
	end
end
