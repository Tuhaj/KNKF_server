require 'spec_helper'

describe "Model Admin" do
  let(:admin) {create(:admin)}
  subject {admin}
  its(:email) {should == 'zrazic@wp.pl'}
  its(:password) {should == 'secretly_created'}
end
