require 'rails_helper'

RSpec.describe "users/index", type: :view, focus: false do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email@example.com"
      ),
      User.create!(
        :name => "Name2",
        :email => "Email2@example.com"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Email@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Email2@example.com".to_s, :count => 1
  end
end
