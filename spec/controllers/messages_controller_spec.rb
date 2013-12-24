require 'spec_helper'

describe MessagesController do
  let(:user) { create(:user) }
  
  context 'checks for logged in user' do
    before(:each) do
      sign_in user
    end

    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    end

    describe "POST create" do
      it "message can be created" do
        post 'create', message: {content: "Hello!", membership: true, title: "hello message"}
        message = assigns[:message]
        Message.exists?(message).should be_true
        response.should be_redirect
      end
    end

    describe "created message has association" do
      it "checks association success" do
        post 'create', message: {content: "Hello!", membership: true, title: "hello message"}
        message = assigns[:message]
        message.user.should eql user
      end
    end
  end

  context 'checks without authentication' do
    
    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should_not be_success
      end
    end

    describe "POST create" do
      it "message can be created" do
        post 'create', message: {content: "Hello!", membership: true, title: "hello message"}
        message = assigns[:message]
        Message.exists?(message).should be_false
        response.should be_redirect
      end
    end

    describe "created message has association" do
      it "checks association success" do
        post 'create', message: {content: "Hello!", membership: true, title: "hello message"}
        message = assigns[:message]
        message.should eql nil
      end
    end
  end
end
