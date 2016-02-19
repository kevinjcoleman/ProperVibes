require 'rails_helper'

RSpec.describe Admin::DashboardController, :type => :controller do
   before :each do
      @user = FactoryGirl.create(:user)
   end
  describe "GET index" do
    it "returns http success" do
      sign_in @user
      get :index
      expect(page).to have_content("Admin")
      expect(response).to be_success
    end

    it "redirects if not logged in" do 
      get :index
      expect(response).to_not have_content("Admin")
    end

    it "redirects if not admin" do 
      get :index
      expect(response).to_not have_content("Admin")
    end
  end
end
