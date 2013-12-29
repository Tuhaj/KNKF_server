require 'spec_helper'

describe MeetingsUsers do
  let(:user) {create(:user)}
  let(:meeting) {create(:meeting)}
  it "should make association" do
    meeting.user = user
    meeting.user.should == user
  end

end
