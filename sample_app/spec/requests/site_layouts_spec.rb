require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	describe "application layout" do
		it "has valid links" do
			get root_path
			expect(response).to have_http_status(:success)
			assert_template 'static_pages/home'
			assert_select "a[href=?]", root_path, count: 2
			assert_select "a[href=?]", help_path
			assert_select "a[href=?]", about_path
			assert_select "a[href=?]", contact_path
			get signup_path
			assert_select 'title', full_title("Sign Up")
		end
	end

	describe 'correct titles' do

		it 'get / or /home' do
			get root_path
			expect(response).to have_http_status(:success)
			assert_template 'static_pages/home'
			assert_select 'title', base_title
		end

		%w{help about contact}.each do |page_name|
			it "get /#{page_name}" do
			  get send("#{page_name}_path")
			  expect(response).to have_http_status(:success)
			  assert_template "static_pages/#{page_name}"
			  assert_select 'title', "#{page_name.capitalize} | #{base_title}"
			end
		end

		# it 'get /help' do
		# 	get help_path
		# 	expect(response).to have_http_status(:success)
		# 	assert_template 'static_pages/help'
		# 	assert_select 'title', 'Help | ' + base_title
		# end

		# it 'get /about' do
		# 	get about_path
		# 	expect(response).to have_http_status(:success)
		# 	assert_template 'static_pages/about'
		# 	assert_select 'title', 'About | ' + base_title
		# end

		# it 'get /contact' do
		# 	get contact_path
		# 	expect(response).to have_http_status(:success)
		# 	assert_template 'static_pages/contact'
		# 	assert_select 'title', 'Contact | ' + base_title
		# end
	end
end
