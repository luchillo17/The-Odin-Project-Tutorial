require 'rails_helper'

RSpec.describe "users/index", type: :view do
	before(:each) do
		FactoryGirl.reload
		assign(:users, Kaminari.paginate_array([
			FactoryGirl.create(:user),
			FactoryGirl.create(:user)
		]).page(1))
	end

	it "renders a list of users when logged in" do
		log_in_as(User.first)
		render
		assert_select "tr>td", :text => /user\d+\z/, :count => 2
		assert_select "tr>td", :text => /user\d+@example.com/, :count => 2
	end
end
