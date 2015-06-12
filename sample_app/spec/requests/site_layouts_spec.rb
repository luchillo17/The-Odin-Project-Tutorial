require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
  describe "GET /" do
    it "valid layout links" do
      get root_path
      expect(response).to have_http_status(:success)
      assert_template 'static_pages/home'
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
    end
  end
end
