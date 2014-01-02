require "spec_helper"

describe UserMailer do
  let(:user) {create(:user)} 
  let(:mail) {stub(dupa: true)}
  subject {UserMailer.welcome_mail(user)}

  its(:to) {should include(user.email)}
  its(:subject) {should include("Potwierdzenie rejestracji")}
  its(:from) {should include("knkf.uw@gmail.com")}

  it "sends welcome email" do
    new_user = User.new(full_name: "Shiba", email:"shiba@wp.pl", password:"my_master")
    new_user.should_receive(:send_welcome_mail).and_return(mail)
    new_user.save
  end
end
