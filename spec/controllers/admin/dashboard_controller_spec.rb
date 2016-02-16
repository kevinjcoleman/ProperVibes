require 'rails_helper'

RSpec.describe Admin::DashboardController, :type => :controller do
   before :each do
      user = FactoryGirl.create(:user)
      sign_in user
   end
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end
end
