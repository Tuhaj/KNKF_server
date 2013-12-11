class Api::V1::BaseController < ActionController::Base
	 skip_before_filter :verify_authenticity_token
  	 respond_to :json

     before_filter :authenticate_user_from_token!

	def authenticate_user_from_token!
    user_token = params[:authentication_token].presence
    user       = user_token && (current_user = User.find_by_authentication_token(user_token))

    if user
      @current_user = current_user
    else
      render json: { message: "Wrong token" }, status: 401
    end
  end

  def current_user
    @current_user
  end

end