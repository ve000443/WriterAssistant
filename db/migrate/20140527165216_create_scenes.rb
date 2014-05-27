class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :content
      t.string :location
      t.string :period

      t.timestamps
    end
  end
end
