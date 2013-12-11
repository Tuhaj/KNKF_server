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

	describe "/api/v1/meetings/1" do
		let!(:meeting) { create(:meeting)}
		let!(:user) { create(:user) }
		let(:url) { "/api/v1/meetings/#{meeting.id}" }


		it "shows meeting" do
			puts meeting.inspect
			get url, format: :json, authentication_token: user.authentication_token
			puts url
			puts response
			response.body.should eql(meeting.to_json)
			response.status.should eql(200)
		end
	end
end