require 'spec_helper'
describe Reading do
	  it "scope works" do
	  reading1 = create(:reading)
	  reading2 = create(:reading, votes_for: 4)
	  reading3 = create(:reading, votes_for: 5, meeting_id: 1)
	  reading4 = create(:reading, votes_for: 5)
	  Reading.count.should eq 4
	  Reading.best.count.should eq 2
	  Reading.active.best.count.should eq 1
	end

	 xit "my reading method" do
	 	user = create(:user)
	 	reading = create(:reading, recomended_by: user.id.to_s)
	 	reading.is_reading_mine?(user).should be_true
	 end

	 it "reading user association" do
	 	current_user = create(:user)
	 	reading = create(:reading)
	 	reading.user = current_user
	 	reading.user.should eq current_user
	 end

end
