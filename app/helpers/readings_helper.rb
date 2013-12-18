module ReadingsHelper
  def reading_status(reading)
    reading.is_reworked ? t("reading.inactual") : t("reading.actual")
  end

  #VOTING SYSTEM

  def vote_info(reading)
    reading.meeting ? link_to(reading.meeting.name, meeting_path(reading.meeting)) : t("reading.voting_in_progress")
  end

  def cancel_vote(reading)
    reading == current_user.reading ? link_to(t("reading.cancel_vote"), reading_unvote_path(reading), method: :post) : ""
  end

  def vote_or_cancel(reading)
    if current_user.has_a_vote
      link_to t("reading.vote") , reading_vote_path(reading), method: :post
    else
      cancel_vote(reading)
    end
  end

  def display_voting_for_members(reading)
    current_user.knkf_member ? vote_or_cancel(reading) : t("reading.voting_restriciton")
  end

  def voting_open_for_reading(reading)
    reading.meeting ? t("reading.voting_closed") : display_voting_for_members(reading)
  end

end
