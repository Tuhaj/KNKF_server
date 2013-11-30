class UserMailer < ActionMailer::Base
  default from: "knkf.uw@gmail.com"


    def welcome_mail(user)
  	@user = user
  	mail to: @user.email, subject: "Potwierdzenie rejestracji"
  end

  	def application_mail(user)
  		@user = user
  		mail to: "piotr.zientara1@gmail.com", subject: "Aplikacja o członkowstwo"
  	end
end
