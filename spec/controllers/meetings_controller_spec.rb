require 'spec_helper'


describe MeetingsController do
  
    # This should return the minimal set of attributes required to create a valid
  # Category. As you add validations to Category, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  
  let!(:meeting) { create(:meeting)}
  let!(:user) { create(:user) }
  let!(:url) { "/meetings/#{meeting.id}" }
  before(:each) do
    unless example.metadata[:skip_before]
      sign_in user
    end
  end


  # debugger
  # puts assigns[:meeting].inspect
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CategoriesController. Be sure to keep this updated too.

  describe "GET 'index'" do     
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', {:id => meeting.to_param}
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "created successfully" do
      post 'create', :meeting => {name: "Heidi", date: Date.parse("2015-12-12"), description:"Illogical but interesting"}
      created_meeting = Meeting.last.name
      puts response.status
      response.code.should eql("302") 
      created_meeting.should eql("Heidi")
    end
  end

  describe "edit for knkf users" do

    it "KNKF user can edit meetings" do
      (get 'edit', id: meeting.id).should be_success
    end
  end

  describe "edit for guests" do
    let!(:user) { create(:user_guest) }

    it "guest user cannot edit meetings", skip_before: true do
      sign_in user
      expect {get 'edit', id: meeting.id}.to raise_error{CanCan::AccessDenied}
    end
  end

  describe "'update'" do
    xit "returns http success" do
      patch 'update'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    xit "returns http success" do
      delete 'destroy'
      response.should be_success
    end
  end
end