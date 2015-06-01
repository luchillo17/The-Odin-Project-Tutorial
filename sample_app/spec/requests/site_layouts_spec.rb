require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
	# pending
	# render_views

	describe "Layout links" do
		it "tests the links in the home directory" do
			get "/"
			# puts response
			expect(response).to have_http_status(200)
			assert_template 'static_pages/home'
			# assert_select "a[href=?", root_path, count: 2
			# assert_select "a[href=?]", static_pages_help_path, count: 2
			# assert_select "a[href=?]", static_pages_about_path, count: 2
			# assert_select "a[href=?]", static_pages_contact_path, count: 2
		end
	end
end
