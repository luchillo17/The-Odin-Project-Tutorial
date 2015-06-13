require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe 'full title helper' do
    it 'returns valid title' do
      expect(full_title).to be_eql(base_title)
      expect(full_title('Help')).to be_eql("Help | #{base_title}")
    end
  end
end