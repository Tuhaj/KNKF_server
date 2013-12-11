require "spec_helper"

describe "/api/v1/meetings", :type => :api do
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
end
end
