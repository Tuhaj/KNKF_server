class Reading < ActiveRecord::Base
	belongs_to :meeting

	def is_reading_mine?(user)
		recomended_by == "#{user.id}"
	end

	def add_reading_to_meeting(meeting)
 		r = @reading
 		r.meeting = meeting
		r.save
	end
end
