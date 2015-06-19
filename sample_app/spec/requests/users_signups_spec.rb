require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do

	let(:valid_user) { FactoryGirl.attributes_for(:user) }

	let(:invalid_user) do
		FactoryGirl.attributes_for(:user,	name: '',
																			email: 'user',
																			password: 'foo',
																			password_confirmation: 'bar'
															)
	end
	context "Get /signup" do
		describe "with valid data" do
			it "should accept valid input" do
				get(signup_path)
				expect(response).to have_http_status(200)
				expect{	post_via_redirect users_path, user: valid_user }.to change(User, :count).by(1)
				assert_template 'users/show'
				expect(is_logged_in?).to be(true)
				expect(flash).to_not be_empty
				assert_select 'div.alert-success'
			end
		end

		describe "with invalid data" do
			it "should reject invalid input" do
				get(signup_path)
				expect(response).to have_http_status(200)
				expect{	post users_path, user: invalid_user }.to_not change(User, :count)
				assert_template 'users/new'
				assert_select 'div#error_explanation'
				assert_select 'div.field_with_errors'
			end
		end
	end
end
