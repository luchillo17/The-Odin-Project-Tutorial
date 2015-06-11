require 'rails_helper'

RSpec.describe "users/index", type: :view, focus: false do
	before(:each) do
		assign(:users, [
			User.create!(
				:name			=> "Name",
				:email		=> "email@example.com",
				:password	=> "belorofonte",
				:password_confirmation => "belorofonte"
			),
			User.create!(
				:name			=> "Name2",
				:email		=> "email2@example.com",
				:password	=> "belorofonte",
				:password_confirmation => "belorofonte"
			)
		])
	end

	it "renders a list of users" do
		render
		assert_select "tr>td", :text => "Name".to_s, :count => 1
		assert_select "tr>td", :text => "email@example.com".to_s, :count => 1
		assert_select "tr>td", :text => "Name2".to_s, :count => 1
		assert_select "tr>td", :text => "email2@example.com".to_s, :count => 1
	end
end
