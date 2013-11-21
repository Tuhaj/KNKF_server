require 'spec_helper' 

describe "Model User" do

	before(:all) do
		@user = User.new
		@meeting = Meeting.new
	end

	it "User can be created" do
		expect { @user.save }.to change { User.count }.by 1
	end

	it "has association with meeting" do
		@meeting.users.build
		@meeting.users.should_not be_nil
	end
end