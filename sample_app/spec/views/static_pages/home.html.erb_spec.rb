require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
	# render_views
  describe "Layout links" do
    it "tests the links in the home directory" do
    	render
    	# expect(response).to have_http_status(200)
    	assert_template 'static_pages/home'
    	# puts(rendered)
    	# assert_select "a", href: root_path, count: 2
      # assert_select "a", href: static_pages_help_path, count: 2
      # assert_select "a[href=?]", static_pages_about_path, count: 2
      # assert_select "a[href=?]", static_pages_contact_path, count: 2
    end
	end
end
