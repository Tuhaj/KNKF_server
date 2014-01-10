class LoginController < ApplicationController
  rescue_from OAuth::Unauthorized, :with => Proc.new{redirect_to root_path}

  def callback
    access_token = request_token.get_access_token(oauth_verifier: params[:oauth_verifier])
    redirect_to root_path
  end

  def oauth_failure
    redirect_to root_path
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
