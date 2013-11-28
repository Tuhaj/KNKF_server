class Reading < ActiveRecord::Base
	belongs_to :meeting

	def is_reading_mine?(user)
		recomended_by == "#{user.id}"
	end

end
