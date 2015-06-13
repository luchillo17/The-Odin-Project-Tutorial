require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
	describe "Layout links" do
			it "tests the links in the home directory" do
				render
				assert_template 'static_pages/home'
				assert_select "a:match('href', ?)", "http://www.railstutorial.org", count: 1
				assert_select "a:match('href', ?)", signup_path, count: 1
				assert_select "a:match('href', ?)", "http://rubyonrails.org/", count: 1
			end
		end
end
