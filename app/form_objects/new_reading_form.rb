class NewReadingForm < ReadingForm

  delegate :"user=", to: :reading

  def initialize(user)
    @reading = Reading.new
    @reading.user = user
    @reading.votes_for = 0
    @reading.is_reworked = false
  end


end