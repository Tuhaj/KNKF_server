module ApplicationHelper
  def display_login_button
   current_user.knkf_member ? t('log_in_as_knkf') : t('log_in_as_guest')
  end

  def permitions_title
    current_user.knkf_member ? t('knkf_permissions') : t('guest_permissions')
  end

end
