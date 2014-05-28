class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|
      t.integer :anecdote_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :tag_relationships, :anecdote_id
    add_index :tag_relationships, :tag_id
    add_index :tag_relationships, [:anecdote_id, :tag_id], unique: true
  end
end
