require 'spec_helper'

describe ReadingsController do

  before :each do
    @user = create(:user)
    @reading = create(:reading, :user_id => @user.id)
    sign_in :user, @user
    controller.stub(:current_user).and_return(@user)
  end

  context 'checks response for actions' do
    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

    describe "GET 'show'" do
      it "returns http success" do
        get :show, id: @reading.id
        response.should be_success
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    end

    # describe "GET 'create'" do
    #   it "returns http success" do
    #     post 'create'
    #     response.should be_success
    #   end
    # end

    # describe "GET 'edit'" do
    #   it "returns http success" do
    #     get 'edit'
    #     response.should be_success
    #   end
    # end

    # describe "GET 'update'" do
    #   it "returns http success" do
    #     get 'update'
    #     response.should be_success
    #   end
    # end

    # describe "GET 'destroy'" do
    #   it "returns http success" do
    #     get 'destroy'
    #     response.should be_success
    #   end
    # end
  end
end
