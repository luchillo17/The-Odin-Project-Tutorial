require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe StaticPagesHelper, type: :helper do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe 'full title helper' do
    it 'returns valid title' do
      expect(full_title).to be(base_title)
      expect(full_title('Help')).to eq("Help | #{base_title}")
    end
  end
end