class Reading < ActiveRecord::Base
  belongs_to :meeting
  has_many :users
  has_many :notes
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true 
  #validates_uniqueness_of :title => { :message => "Podana książka już istnieje" }

  before_destroy :cancel_votes_for_this_reading

  def self.active
    where(meeting_id: nil)
  end

  def self.best
    where(votes_for: Reading.all.maximum(:votes_for))
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