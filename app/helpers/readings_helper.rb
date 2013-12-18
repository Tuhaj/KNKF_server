module ReadingsHelper
  def reading_status(reading)
    reading.is_reworked ? "Kandydatura nieaktualna" : "Kandydatura aktualna"
  end

  def vote_info(reading)
    reading.meeting ? link_to(reading.meeting.name, meeting_path(reading.meeting)) : "W trakcie głosowania"
  end

  def cancel_vote(reading)
    reading == current_user.reading ? link_to('Wycofaj głos', reading_unvote_path(reading), method: :post) : ""
  end

  def vote_or_cancel(reading)
    if current_user.has_a_vote
      link_to 'Zagłosuj', reading_vote_path(reading), method: :post
    else
      cancel_vote(reading)
    end
  end

  def display_voting_for_members(reading)
    current_user.knkf_member ? vote_or_cancel(reading) : "Jako gość nie możesz głosować"
  end

  def voting_open_for_reading(reading)
    reading.meeting ? "Głosowanie zamknięte" : display_voting_for_members(reading)
  end
end
