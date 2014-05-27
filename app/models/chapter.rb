class Chapter < ActiveRecord::Base
	validates :number, presence: true, uniqueness: true
	validates :title, presence: true
end
