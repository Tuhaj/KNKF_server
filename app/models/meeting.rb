class Meeting < ActiveRecord::Base
	has_and_belongs_to_many :users
	
	def is_user_in_meeting?(user)
		users.where(email: user.email).present?
	end
end
