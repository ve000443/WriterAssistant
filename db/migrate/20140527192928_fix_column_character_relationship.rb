class FixColumnCharacterRelationship < ActiveRecord::Migration
  def change
  	rename_column :character_relationships, :id_character, :character_id
  	rename_column :character_relationships, :id_scene, :scene_id
  end
end
