class HomeController < ApplicationController
  def index
    return redirect_to rails_admin_path if admin_signed_in?
    return redirect_to new_user_session_path unless user_signed_in?
  end
end
