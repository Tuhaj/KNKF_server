require 'spec_helper'

describe HomeController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin)}

  describe "for not signed in user should redirect" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "for signed in user should response with index" do
    it "returns http success" do
      sign_in user
      get 'index'
      response.should be_success
    end
  end

  describe "if logged in as admin redirects to admin panel" do
    it "returns http success" do
      sign_in admin
      get 'index'
      response.should redirect_to(rails_admin_path)
    end
  end

end
