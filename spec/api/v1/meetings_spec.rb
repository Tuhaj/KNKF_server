require "spec_helper"

describe "/api/v1/meetings" do
  let!(:user) { create(:user) }
  let!(:meeting) { create(:meeting)}

  context "meetings viewable by this user" do
    let(:url) { "/api/v1/meetings" }

    it "json" do
      get url, format: :json, authentication_token: user.authentication_token
      meetings_json = Meeting.all.to_json
      response.body.should eql(meetings_json)
      response.status.should eql(200)
      meetings = JSON.parse(response.body)
      meetings.any? do |m|
        m["name"] == meeting.name
      end.should be_true
    end

    it "xml" do
      get url, format: :xml, authentication_token: user.authentication_token
      meetings_xml = Meeting.all.to_xml
      response.body.should eql(meetings_xml)
      response.status.should eql(200)
    end
  end

  describe "/api/v1/meetings/:id" do
    let!(:meeting) { create(:meeting)}
    let!(:user) { create(:user) }
    let(:url) { "/api/v1/meetings/#{meeting.id}" }

    it "shows meeting" do
      get url, format: :json, authentication_token: user.authentication_token
      response.body.should eql(meeting.to_json)
      response.status.should eql(200)
    end
  end

  context "creating a meeting" do
    let(:url) { "/api/v1/meetings" }

    it "successful JSON" do
      post url, format: :json, authentication_token: user.authentication_token,
      meeting: {name: "Test_Created_Meeting", date: "2014-12-12"}
      meeting = Meeting.find_by_name!("Test_Created_Meeting")
      route = "/api/v1/meetings/#{meeting.id}"
      response.status.should eql(201)
      response.headers["Location"].should eql(route)
      response.body.should eql(meeting.to_json)
    end
  end
end