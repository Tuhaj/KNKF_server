module UserHelper
  def user_name(user)
    if user.present?
      "Zaproponowane przez: " + user.full_name
    else
      ""
    end
  end  
end
