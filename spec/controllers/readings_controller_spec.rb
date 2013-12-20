require 'spec_helper'

describe ReadingsController do

  before :each do
    @user = create(:user)
    @reading = create(:reading, user_id: @user.id)
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

    describe "user can create new reading" do
      it "returns http success" do
        post 'create', :reading => {title: "Wola Mocy", author: "Nietzsche"}
        reading = Reading.where(title: "Wola Mocy").first
        Reading.exists?(reading).should
      end
    end

    describe "GET 'edit'" do
      it "can be edited" do
        (get 'edit', id: @reading.id).should be_success
      end
    end

    describe "update own reading" do
      it "allows to update" do
        reading = create(:reading, user: @user)
        (post 'update', reading: {title: "Wiedza", author: "Changer"}, id: reading.id)
        response.should be_redirect
        expect(Reading.last.author).to eql "Changer"
      end
    end

    # describe "GET 'destroy'" do
    #   it "returns http success" do
    #     get 'destroy'
    #     response.should be_success
    #   end
    # end
  end
end
