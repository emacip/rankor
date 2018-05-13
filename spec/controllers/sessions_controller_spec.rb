require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    request.env['omniauth.auth'] = stub_omniauth
  end

  describe "#create" do
    it "should successfully create a user" do
      expect {
        post :create, params: { provider: :google_oauth2 }
      }.to change{ User.count }.by(1)
    end

    it "should successfully create a session" do
      expect(session[:id]).to be_nil
      post :create, params: { provider: :google_oauth2 }
      expect(session[:id]).not_to be_nil
    end

    it "should redirect the user to the root url" do
      post :create, params: { provider: :google_oauth2 }
      expect(response).to redirect_to root_url
    end

  end

  describe "#destroy" do
    before do
      post :create, params: { provider: :google_oauth2 }
    end

    it "should clear the session" do
      expect(session[:id]).not_to be_nil
      delete :destroy
      expect(session[:id]).to be_nil
    end

    it "should redirect to the home page" do
      delete :destroy
      response.should redirect_to root_url
    end
  end
end
