require 'rails_helper'

RSpec.describe "UsersIndex", type: :request do

  let!(:admin) { FactoryGirl.create(:admin) }
	let!(:users) { FactoryGirl.create_list(:user, 35) }

  describe "index" do
    it "as admin with pagination and delete links." do
    	log_in_as(admin)
      get users_path
      expect(response).to have_http_status(200)
      assert_template 'users/index'
      assert_select 'ul.pagination'
      # byebug
      User.page(1).each do |user|
      	assert_select 'td', text: user.name
      	assert_select 'a[href=?]', user_path(user)
      	assert_select 'a[href=?]', edit_user_path(user)
        if !user.admin?
          assert_select 'a[href=?][data-method=?]', user_path(user), 'delete', text: 'Destroy'
        end
      end
      expect { delete user_path(users.first) }.to change(User, :count).by(-1)
    end

    it 'as non-admin' do
      log_in_as(users.first)
      get users_path
      assert_select 'a[data-method=?]', 'delete', text: 'Destroy', count: 0
    end
  end
end
