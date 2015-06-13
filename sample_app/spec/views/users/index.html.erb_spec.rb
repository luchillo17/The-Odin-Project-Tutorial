require 'rails_helper'

RSpec.describe "users/index", type: :view do
	before(:each) do
		FactoryGirl.reload
		assign(:users, [
			FactoryGirl.create(:user),
			FactoryGirl.create(:user)
		])
	end

	it "renders a list of users" do
		render
		assert_select "tr>td", :text => /user\d+\z/, :count => 2
		assert_select "tr>td", :text => /@example.com/, :count => 2
	end
end
