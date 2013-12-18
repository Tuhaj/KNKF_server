module UserHelper
  def user_name(user)
    if user.present?
      "Zaproponowane przez: " + user.full_name
    else
      ""
    end
  end  

  def membership_info(user)
    if user.knkf_member?
      "KNKF"
    else
      "gość"
    end
  end

  def sign_out_from_meeting(user)
    if user == current_user
      link_to 'wypisz się', meeting_remove_me_path(@meeting), class: "btn btn-link", :method =>:delete
    else
      ""
    end
  end

  def sign_in_or_out_to_meeting(user)
  end

end
