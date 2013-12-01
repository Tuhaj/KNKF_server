class UserController < ApplicationController
	  
	  def edit
	  	#application for KNKF membership
	  	UserMailer.application_mail(current_user).deliver
	  	redirect_to home_index_path, :notice => "Udało się wysłać formularz"
	  end
end
