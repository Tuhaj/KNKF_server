class MeetingsUsers < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :user

  validate :one_to_meeting

  def one_to_meeting
    errors.add(:meeting, "jesteś już dopisany") if meeting.users.exists?(user)
  end
end