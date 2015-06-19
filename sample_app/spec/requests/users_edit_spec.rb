require 'rails_helper'

RSpec.describe "UsersEdit", type: :request do

	let(:user_attr) { FactoryGirl.attributes_for(:user) }
	let(:user) { FactoryGirl.create(:user, user_attr) }

	let(:user_attr2) { FactoryGirl.attributes_for(:user,	password: '',
																												password_confirmation: ''
																											)
													}

	describe 'with valid info' do
		it 'edit successfully with friendly forwarding' do
			get edit_user_path(user)
			expect(session[:forwarding_url]).to eq(edit_user_url(user))
			expect(response).to redirect_to(login_path)
			log_in_as(user)
			expect(response).to redirect_to(edit_user_path(user))
			expect(session[:forwarding_url]).to be_nil
			patch user_path(user), user: user_attr2
			expect(flash).to_not be_empty
			expect(response).to redirect_to user
			user.reload
			expect(user.name).to eq user_attr2[:name]
			expect(user.email).to eq user_attr2[:email]
		end
	end

	describe "with invalid info" do
		it "expect errors and render edit template" do
			log_in_as(user)
			get edit_user_path(user)
			expect(response).to have_http_status(200)
			assert_template 'users/edit'
			user_attr[:password]='foo'
			patch user_path(user), user: user_attr
			expect(response).to have_http_status 200
			assert_template 'users/edit'
		end
	end
end
