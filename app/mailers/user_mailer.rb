class UserMailer < ActionMailer::Base
  default from: "KNKF@knkf.pl"


    def welcome_mail(user)
  	@user = user
  	mail to: user.email, subject: "Potwierdzenie rejestracji"
  end

end
