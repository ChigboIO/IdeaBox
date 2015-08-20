class Idea < ActiveRecord::Base
	belongs_to :member
	has_many :likes

	validates_presence_of :title
end