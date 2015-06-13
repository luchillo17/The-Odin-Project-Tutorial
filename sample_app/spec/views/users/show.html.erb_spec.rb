require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, FactoryGirl.create(:user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/user\d/)
    expect(rendered).to match(/@example.com/)
  end
end
