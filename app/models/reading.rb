class Reading < ActiveRecord::Base
	belongs_to :meeting

	before_destroy :cancel_votes_for_this_reading

	def is_reading_mine?(user)
		recomended_by == "#{user.id}"
	end

	def cancel_votes_for_this_reading
		User.all.each do |user|
  			if user.voting_for == "#{self}"
  				user.voting_for = nil
  				user.has_a_vote = true
  				user.save!
  			end
		end
	end

end
