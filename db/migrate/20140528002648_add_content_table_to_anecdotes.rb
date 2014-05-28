class AddContentTableToAnecdotes < ActiveRecord::Migration
  def change
  	add_column :anecdotes, :content, :string
  end
end
