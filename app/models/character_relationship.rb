class CharacterRelationship < ActiveRecord::Base
  belongs_to :scene, class_name: "Scene"
  belongs_to :character, class_name: "Character"
  validates :scene_id, presence: true
  validates :character_id, presence: true
end
