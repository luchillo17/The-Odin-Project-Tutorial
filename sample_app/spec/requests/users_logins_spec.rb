require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do

	let(:session_attr) { FactoryGirl.attributes_for(:session) }
	let!(:user) { FactoryGirl.create(:user, session_attr) }

	describe 'with valid params' do
		it 'should login, change links and logout' do
			get login_path
			assert_select "a[href=?]", login_path, count: 1
			post login_path, session: { email: session_attr[:email], password: session_attr[:password] }
			expect(is_logged_in?).to be(true)
			expect(response).to redirect_to user
			follow_redirect!
			assert_template 'users/show'
			assert_select "a[href=?]", login_path, count: 0
			assert_select "a[href=?]", logout_path, count: 1
			assert_select "a[href=?]", user_path(user), count: 1
			delete logout_path
			expect(is_logged_in?).to_not be(true)
			expect(response).to redirect_to root_url
			# Simulate a user clicking logout in a second tab or window.
			delete logout_path
			follow_redirect!
			assert_select "a[href=?]", login_path, count: 1
			assert_select "a[href=?]", logout_path, count: 0
			assert_select "a[href=?]", user_path(user), count: 0


		end

		it 'login with remembering' do
			log_in_as(user, remember_me: '1')
			expect(cookies['remember_token']).to eq assigns(:user).remember_token
		end

		it 'login without remembering' do
			log_in_as(user, remember_me: '0')
			expect(cookies['remember_token']).to be_nil
		end
	end

	describe "with invalid params" do
		it "should use flash that last 1 request" do
			get login_path
			expect(response).to have_http_status(200)
			assert_template 'sessions/new'
			post login_path, session: { email: '', password: '' }
			expect(response).to have_http_status(200)
			assert_template 'sessions/new'
			expect(flash).to_not	be_empty
			get root_path
			expect(response).to have_http_status(200)
			expect(flash).to	be_empty
		end
	end
end
