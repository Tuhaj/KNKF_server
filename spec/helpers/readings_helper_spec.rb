require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ReadingsHelper. For example:
#
# describe ReadingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end



describe ReadingsHelper do

  let(:reading_old) {create(:reading, is_reworked: true)}
  let(:reading_new) {create(:reading)}
  let(:meeting) {create(:meeting)}

  describe "reading" do
    it "should return 'inactual' for reworked" do
      reading = reading_old
      expect(reading_status(reading)).to eql t("reading.inactual")
    end
    it "should return 'inactual' for reworked" do
      reading = reading_new
      expect(reading_status(reading)).to eql t("reading.actual")
    end
  end
  describe "voting" do
    it "vote info result for association" do
      reading = reading_new
      reading.meeting = meeting
      expect(vote_info(reading)).to eql link_to(reading.meeting.name, meeting_path(reading.meeting)) 
    end
    it "vote info result for no association" do
      reading = reading_new
      expect(vote_info(reading)).to eql t("reading.voting_in_progress")

    end
  end
end
