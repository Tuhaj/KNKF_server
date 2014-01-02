require "spec_helper"

describe UserMailer do
  let(:user) {create(:user)} 
  let!(:message) {create(:message)}

  context "welcome mail" do 
    subject {UserMailer.welcome_mail(user)}

    its(:to) {should include(user.email)}
    its(:subject) {should include("Potwierdzenie rejestracji")}
    its(:from) {should include("knkf.uw@gmail.com")}
  end
  context "Application Mail" do
    subject {UserMailer.application_mail(user)}

    its(:to) {should include("piotr.zientara1@gmail.com")}
    its(:subject) {should include("Wiadomość do administratora")}
    its(:from) {should include("knkf.uw@gmail.com")}
  end
end
