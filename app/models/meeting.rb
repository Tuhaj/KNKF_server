class Meeting < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_one :reading
	belongs_to :user

	validates :name, presence: true 
	validates :name, :uniqueness => { :message => "Nazwa spotkania zajęta" }
	validates_presence_of :date
	validate :is_meeting_actual?

	def is_user_in_meeting?(user)
		users.where(email: user.email).present?
	end

	def is_meeting_actual?
		errors.add(:date, " - podana data nie może być wcześniejsza niż dziś") if date.present? && date < Date.today  
	end

	def end_vote
	  self.reading = Reading.all.active.best.first
      User.update_all(voting_for: nil)
      User.update_all(has_a_vote: true)
     end
end
