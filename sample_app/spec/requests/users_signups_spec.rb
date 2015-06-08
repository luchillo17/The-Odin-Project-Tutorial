require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do

	let(:valid_user) do 
		{
			name: "example",
			email: 'example@example.com',
			password: 'foofoo',
			password_confirmation: 'foofoo'
		} 
	end

	let(:invalid_user) do 
		{
			name: "",
			email: 'user@invalid',
			password: 'foo',
			password_confirmation: 'bar'
		} 
	end

	before :all do
		get signup_path
		expect(response).to have_http_status(200)
	end

	describe "GET /users_signups" do
		context 'with valid params' do
		  it "render show page on valid signup" do
				expect{post_via_redirect(users_path, user: valid_user)}.to change{ User.count }
				assert_template "users/show"
				expect(flash).not_to be_empty
			end
		end
		context "with invalid params" do	
			it "render new page on invalid signup" do
				get signup_path
				expect(response).to have_http_status(200)
				expect{post(users_path, user: invalid_user)}.not_to change{ User.count }
				assert_template 'users/new'
				assert_select 'div#error_explanation'
				assert_select 'div.field_with_errors'
			end
		end
	end
end
