require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
	# render_views
  describe "Layout links" do
    it "tests the links in the home directory" do
    	render
    	# expect(response).to have_http_status(200)
    	assert_template 'static_pages/home'
    	# puts(rendered)
      assert_select "a[href=?]", "http://www.railstutorial.org"
      assert_select "a[href=?]", signup_path
    	assert_select "a[href=?]", "http://rubyonrails.org/"
    end
	end
end