require 'spec_helper'

describe Reading do
  let(:user) {create(:user)}
  let!(:reading) {create(:reading)}

  it "scope works" do
    reading2 = create(:reading, votes_for: 4)
    reading3 = create(:reading, votes_for: 5, meeting_id: 1)
    reading4 = create(:reading, votes_for: 5)
    Reading.count.should eq 4
    Reading.best.count.should eq 2
    Reading.active.best.count.should eq 1
  end

  it "reading user association" do
    reading.user = user
    reading.user.should eq user
  end

end
