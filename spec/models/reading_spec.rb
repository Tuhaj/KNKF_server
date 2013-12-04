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
end
