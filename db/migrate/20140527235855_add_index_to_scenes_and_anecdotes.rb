class AddIndexToScenesAndAnecdotes < ActiveRecord::Migration
  def change
  	add_column :scenes, :chapter_id, :integer
  	add_column :anecdotes, :chapter_id, :integer

  	add_index :scenes, :chapter_id
  	add_index :anecdotes, :chapter_id
  end
end
