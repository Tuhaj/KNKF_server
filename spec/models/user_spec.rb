require 'spec_helper' 

describe "Model User" do

	before(:all) do
		@user = User.new
		@meeting = Meeting.new
		@lecture = Lecture.new
		@application = Application.new
	end

	it "User can be created" do
		user = User.new
		user.email = "zrazic@wp.pl"
		user.full_name = "Piotrek"
		expect { @user.save }.to change { User.count }.by 1
	end

	it "has association with meeting" do
		@meeting.users.build
		@meeting.users.should_not be_nil
	end
	it "has association with lecture" do
		@lecture.users.build
		@lecture.users.should_not be_nil
	end

	it "has association with application" do
		@user.applications.build
		@user.applications.should_not be_nil
	end

end