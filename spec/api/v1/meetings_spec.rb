require "spec_helper"

describe "/api/v1/meetings", :type => :api do
let!(:user) { create(:user) }
let!(:meeting) { create(:meeting)}
# before do
# 	user.permissions.create!(:action => "view", :thing => meeting)
# 	end
context "meetings viewable by this user" do
	let(:url) { "/api/v1/meetings" }
	it "json" do
		get "#{url}.json"

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


# describe "/api/v1/meetings", :type => :api do
# 	let!(:admin) { Factory(:admin) }
# end