require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
    	log_in_as(FactoryGirl.create(:user))
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
