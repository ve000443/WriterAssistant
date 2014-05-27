class DropCharacterRelationship < ActiveRecord::Migration
  def change
  	drop_table :character_relationships
    create_table :character_relationships do |t|
      t.integer :character_id
      t.integer :scene_id

      t.timestamps
    end
    add_index :character_relationships, :character_id
    add_index :character_relationships, :scene_id
    add_index :character_relationships, [:character_id, :scene_id], unique: true
  end
end
