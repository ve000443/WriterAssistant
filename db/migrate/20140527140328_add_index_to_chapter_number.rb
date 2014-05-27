class AddIndexToChapterNumber < ActiveRecord::Migration
  def change
  	add_index :chapters, :number, unique: true
  end
end
