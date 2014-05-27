class CreateCharacterRelationships < ActiveRecord::Migration
  def change
    create_table :character_relationships do |t|
      t.integer :id_character
      t.integer :id_scene

      t.timestamps
    end
    add_index :character_relationships, :id_character
    add_index :character_relationships, :id_scene
    add_index :character_relationships, [:id_character, :id_scene], unique: true
  end
end
