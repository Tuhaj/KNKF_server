module UserHelper
  def user_name(user)
    user.present? ? "Zaproponowane przez: " + user.full_name : ""
  end  

  def membership_info(user)
    user.knkf_member? ? "KNKF" : "gość"
  end

  def sign_out_from_meeting(user)
    if user == current_user
      link_to 'wypisz się', meeting_remove_me_path(@meeting), class: "btn btn-link", :method =>:delete
    else
      ""
    end
  end

  def relation_to_meeting(meeting)
    if meeting.is_user_in_meeting?(current_user)
      link_to 'wypisz się', meeting_remove_me_path(meeting), class: "btn btn-link", method: :delete
    else
      link_to 'weź udział', meeting_add_me_path(meeting), class: "btn btn-link", method: :post
    end
  end

  def destroy_meeting_if_can(meeting)
    if can? :destroy, meeting
      link_to('Usuń', meeting, class: "btn btn-link", method: :delete, data: { confirm: t("confirm_deletion") }) + link_to('Edytuj', edit_meeting_path(meeting), class: "btn btn-link")
    else
      ""
    end
  end

  def display_destroy_reading(reading)
    if can? :destroy, reading
      link_to('Skasuj', reading, method: :delete, data: { confirm: 'Czy na pewno chcesz usunąć?' })
    else
      ""
    end
  end

  def heading_my_or_all
    if @only_mine
      "Twoje spotkania"
    else
      "Nadchodzące spotkania"
    end
  end
end