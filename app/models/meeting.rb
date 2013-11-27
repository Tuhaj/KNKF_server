class Meeting < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :name, presence: true 
	validates :name, :uniqueness => { :message => "Nazwa spotkania zajęta" }
	validates :date, presence: true

	validate :is_meeting_actual?

	def is_user_in_meeting?(user)
		users.where(email: user.email).present?
	end
#validations
	def is_meeting_actual?
		errors.add(:date, "data nie może być wcześniejsza niż dziś") if date < Date.today
	end


end
