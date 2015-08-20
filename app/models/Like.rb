class Like < ActiveRecord::Base
	belongs_to :member
	belongs_to :idea

	validates_presence_of :liked_by
	validates_presence_of :idea_id

end