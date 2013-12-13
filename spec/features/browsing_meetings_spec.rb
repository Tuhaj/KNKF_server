require 'spec_helper'

describe "browsing meetings" do


  it "shows meetings list with their names on /meetings" do

    spotkanie = create(:meeting, name: "Spotkanie pierwsze", date: "2024-12-12")
	create(:user)
 	visit '/users/sign_in'
	fill_in("user_email", with: "zrazic@wp.pl")
	fill_in("user_password", with: "secretly_created")
   	click_button("Zaloguj")

   	visit '/meetings'
   	page.should have_text "nowe spotkanie"
    within('#lista_spotkan') do
    page.should have_text "Spotkanie pierwsze"
    page.should have_text "2024"
 	click_link "spotkanie nr #{spotkanie.id}"
 	end
 	within('body') do
 	page.should have_text "Lektura nie została jeszcze ustalona"
    end
 end

   # it "new meeting can be created on /meetings" do
   # 	visit '/meetings'
   # 	page.should have_text "nowe spotkanie"
   # end

end