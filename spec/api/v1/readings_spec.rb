describe "/api/v1/readings" do
  let!(:user) { create(:user) }
  let!(:user_guest) { create(:user_guest) }
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

  describe "/api/v1/readings/:id" do
    let!(:reading) { create(:reading)}
    let!(:user) { create(:user) }
    let(:url) { "/api/v1/readings/#{reading.id}" }

    it "shows reading" do
      get url, format: :json, authentication_token: user.authentication_token
      response.body.should eql(reading.to_json)
      response.status.should eql(200)
    end
  end
    context "creating a reading" do

    let(:url) { "/api/v1/readings" }

    it "successful JSON" do
      post url, format: :json, authentication_token: user.authentication_token,
      reading: {title: "Test_Created_reading", author: "Anonymus"}

      reading = Reading.find_by_title!("Test_Created_reading")
      puts reading.inspect
      route = "/api/v1/readings/#{reading.id}"

      response.status.should eql(201)
      response.headers["Location"].should eql(route) 

      response.body.should eql(reading.to_json)
    end
  end
end