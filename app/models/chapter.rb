class Chapter < ActiveRecord::Base
	default_scope -> { order('number ASC') }
  	has_many :scenes, dependent: :destroy
  	has_many :anecdotes, dependent: :destroy
	validates :number, presence: true, uniqueness: true
	validates :title, presence: true
end
