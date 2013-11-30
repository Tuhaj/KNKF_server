class Reading < ActiveRecord::Base
	

	belongs_to :meeting
	has_many :users

	before_destroy :cancel_votes_for_this_reading

	scope :active, -> {where("meeting_id IS NULL")}
	scope :best, -> {where(votes_for: Reading.all.maximum(:votes_for))}

	def is_reading_mine?(user)
		recomended_by == "#{user.id}"
	end

	def cancel_votes_for_this_reading
		User.all.each do |user|
  			if user.reading == self
  				user.reading = nil
  				user.has_a_vote = true
  				user.save!
  			end
		end
	end

end
