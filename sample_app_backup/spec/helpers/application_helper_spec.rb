require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper, focus:false do

	before :all do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe 'full title helper' do
    it 'should fill in the title as espected' do
      expect(full_title).to eq(@base_title)
      expect(full_title "Help").to eq("Help | #{@base_title}")
    end
  end
end