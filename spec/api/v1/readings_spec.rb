require "spec_helper"

describe "/api/v1/readings for knkf member user" do
  let!(:user) { create(:user) }
  let!(:reading) { create(:reading)}
  context "readings viewable by this user" do
    let(:url) { "/api/v1/readings" }

    it "json" do
      get url, format: :json, authentication_token: user.authentication_token

      readings_json = Reading.active.to_json
      response.body.should eql(readings_json)
      response.status.should eql(200)

      readings = JSON.parse(response.body)

      readings.any? do |r|
        r["title"] == reading.title
      end.should be_true
    end

    it "xml" do
      get url, format: :xml, authentication_token: user.authentication_token

      readings_xml = Reading.active.to_xml
      response.body.should eql(readings_xml)
      response.status.should eql(200)
    end
  end
  context "readings show method" do
    let(:url) { "/api/v1/readings/#{reading.id}" }

    it "shows reading" do
      get url, format: :json, authentication_token: user.authentication_token
      response.body.should eql(reading.to_json)
      response.status.should eql(200)
    end
  end

  context "KNKF user creates a reading" do

    let(:url) { "/api/v1/readings" }

    it "successful JSON" do
      post url, format: :json, authentication_token: user.authentication_token,
      reading: {title: "Test_Created_reading", author: "Anonymus"}


      reading = Reading.find_by_title!("Test_Created_reading")
      route = "/api/v1/readings/#{reading.id}"

      response.status.should eql(201)
      response.headers["Location"].should eql(route) 

      response.body.should eql(reading.to_json)
    end
  end

  context "KNKF user deletes a reading" do

    let(:url) { "/api/v1/readings/#{@reading.id}" }
    it "knkf user destroys his own reading" do
      reading.user = user
      expect {delete url, format: :json, authentication_token: user.authentication_token}.to change(Reading, :count).by(-1)
    end
    let(:url) { "/api/v1/readings/#{reading.id}" }
    it "knkf user destroys alien reading" do
      expect {delete url, format: :json, authentication_token: user.authentication_token}.to raise_error(CanCan::AccessDenied)
    end
  end
end

describe "/api/v1/readings for guest user" do
  let!(:user) { create(:user_guest) }
  let!(:reading) { create(:reading)}
  context "readings viewable by this user" do
    let(:url) { "/api/v1/readings" }
      context "creating a reading" do
        it "Guest user can't create reading" do
          expect {
          post url, format: :json, authentication_token: user.authentication_token,
          reading: {title: "Test_Created_reading", author: "Anonymus"}
          }.to raise_error(CanCan::AccessDenied)
          expect {reading = Reading.find_by_title!("Test_Created_reading")}.to raise_error(ActiveRecord::RecordNotFound)
          route = "/api/v1/readings/#{reading.id}"
      end
    end
  end 
  context "KNKF user deletes a reading" do
    let(:url) { "/api/v1/readings/#{reading.id}" }
    it "knkf user destroys his own reading" do
      reading = Reading.last
      expect {delete url, format: :json, authentication_token: user.authentication_token}.to raise_error(CanCan::AccessDenied)
    end
  end
end