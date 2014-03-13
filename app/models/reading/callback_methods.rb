module Reading::CallbackMethods

  def self.included(base)
    base.before_destroy :cancel_votes_for_this_reading
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