require 'spec_helper'


describe MeetingsController do
  
    # This should return the minimal set of attributes required to create a valid
  # Category. As you add validations to Category, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  
  let!(:meeting) { create(:meeting)}
  let!(:user) { create(:user) }

  before(:each) do 
    sign_in user
  end


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

  describe "edit" do

    # it "should have a current_user" do
    #   expect(subject.current_user).not_to be_nil
    # end

    it "KNKF user can edit meetings" do
    end
  end

  describe "GET 'update'" do
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
