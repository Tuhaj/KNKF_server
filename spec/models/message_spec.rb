require 'spec_helper'

describe Message do
  let(:message) {create(:message)}
  let(:user) {create(:user)}
  subject { message }
  its(:title) {should eql "tytuł wiadomości"}
  its(:membership) {should be_false}
  its(:content) {should eql "Wiadomość"}
  its(:user) {should be_nil}
end