module UserHelper
  def user_name(user)
    user.present? ? t("meeting.recommended") + user.full_name : ""
  end  

  def membership_info(user)
    user.knkf_member? ? "KNKF" : t('guest')
  end

  def sign_out_from_meeting(user)
    if user == current_user
      link_to t('meeting.sign_out'), meeting_remove_me_path(@meeting), class: "btn btn-link", :method =>:delete
    else
      ""
    end
  end

  def relation_to_meeting(meeting)
    if meeting.is_user_in_meeting?(current_user)
      link_to t('meeting.sign_out'), meeting_remove_me_path(meeting), class: "btn btn-link", method: :delete
    else
      link_to t('meeting.take_part'), meeting_add_me_path(meeting), class: "btn btn-link", method: :post
    end
  end

  def destroy_meeting_if_can(meeting)
    if can? :destroy, meeting
      link_to(t('delete'), meeting, class: "btn btn-link", method: :delete, data: { confirm: t("meeting.confirm_deletion") }) + link_to(t('edit'), edit_meeting_path(meeting), class: "btn btn-link")
    else
      ""
    end
  end

  def display_destroy_reading(reading)
    if can? :destroy, reading
      link_to(t('delete'), reading, method: :delete, data: { confirm: t("meeting.confirm_deletion") })
    else
      ""
    end
  end

  def heading_my_or_all
    if @only_mine
      t("meeting.your_meetings")
    else
      t("meeting.incomming_meetings")
    end
  end
end