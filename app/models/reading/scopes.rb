module Reading::Scopes

  def self.included(base)
    base.extend(ClassMethods)
  end
    module ClassMethods
    def active
      where(meeting_id: nil)
    end

    def best
      where(votes_for: Reading.all.maximum(:votes_for))
    end

  end
end