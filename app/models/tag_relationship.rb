class TagRelationship < ActiveRecord::Base
  belongs_to :tag, class_name: "Tag"
  belongs_to :anecdote, class_name: "Anecdote"
  validates :tag_id, presence: true
  validates :anecdote_id, presence: true
end
