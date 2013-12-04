require 'spec_helper'

describe "Model Admin" do

		before(:all) do
		@admin = Admin.new email:"zrazic@wp.pl", password:"asdasdasd"
	end

	it "Admin can be created" do
  	admin = @admin
  	@admin.email.should == 'zrazic@wp.pl'
  	@admin.password.should == 'asdasdasd'

	end

end
