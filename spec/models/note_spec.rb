require 'spec_helper'

describe Note do
  let(:reading) {create(:reading)}
  let(:note) {create(:note)}
  it "creates association with reading" do
    note.reading = reading
    expect{note.reading}.not_to eql nil
  end

end
