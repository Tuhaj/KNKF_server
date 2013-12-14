require 'spec_helper'

describe "browsing meetings" do

  def create_meeting
    visit '/meetings'
    click_link "nowe spotkanie"
    fill_in("meeting_name", with: "Fun")
    fill_in("meeting_date", with: "2025-01-01")
    click_button("Utwórz")
  end

  context 'user_guest_logged_in' do

    before(:each) do
      create(:user_guest)
      visit '/users/sign_in'
      fill_in("user_email", with: "Eustachy@tester.pl")
      fill_in("user_password", with: "secretly_created")
      click_button("Zaloguj")
    end

    it "shows information about beeing guest" do
      page.should have_text "masz uprawnienia gościa"
    end

    it "doesn't show 'nowe spotkanie' button " do
      visit '/meetings'
      page.should_not have_text "nowe spotkanie"
    end

    it "creating new meeting should not be possible" do
      expect{create_meeting}.to raise_error(Capybara::ElementNotFound)
    end
  end

  context 'user_logged_in' do

    before(:each) do
      create(:user)
      visit '/users/sign_in'
      fill_in("user_email", with: "zrazic@wp.pl")
      fill_in("user_password", with: "secretly_created")
      click_button("Zaloguj")
    end   	

    it "shows meetings list with their names on /meetings" do
      spotkanie = create(:meeting, name: "Spotkanie pierwsze", date: "2024-12-12")
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

    it "new meeting can be created on /meetings" do
      visit '/meetings'
      page.should have_text "nowe spotkanie"
      create_meeting
      page.should have_text "Spotkanie Fun"
      page.should have_text "wypisz się"
    end

    it "new meeting has its creator on attendance list" do
      create_meeting
      within('.table-striped') do
        page.should have_text "Piotr Zientara"
        page.should have_text "KNKF"
      end
    end

    it "new meeting can be destroyed by its creator" do
        create_meeting
        visit '/meetings'
        within('table') do
          click_link "Usuń"
          page.should_not have_text "Spotkanie pierwsze"
      end
    end
  end

end