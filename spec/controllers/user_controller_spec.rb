require 'spec_helper'

describe UserController do
let(:user) {create(:user)}

  describe "User can ask for status change" do
    it "returns http success" do
      sign_in user
      message = create(:message)
      get 'edit', id: user.id
      response.should redirect_to home_index_path
    end
  end

end
