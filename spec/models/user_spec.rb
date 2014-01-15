require 'spec_helper' 

describe "Model User" do
	let!(:user) {create(:user)}
	let(:mail) {double(deliver: true)}
	it "User can be created" do
		@user = User.new
		@user.email = "tester@wp.pl"
		@user.full_name = "Piotrek"
		@user.password = "asdasdasd1"
		expect { @user.save! }.to change { User.count }.by 1
	end

	it "has association with meeting" do
		@meeting = Meeting.new
		@meeting.users.build
		@meeting.users.should_not be_nil
	end
	it "has association with lecture" do
		@lecture = Lecture.new
		@lecture.users.build
		@lecture.users.should_not be_nil
	end

	it "has association with application" do
		@message = Message.new
		user.messages.build
		user.messages.should_not be_nil
	end
	  it "sends welcome email" do
    new_user = User.new(full_name: "Shiba", email:"shiba@wp.pl", password:"my_master")
    new_user.should_receive(:send_welcome_mail).and_return(mail.deliver)
    new_user.save
  end
end