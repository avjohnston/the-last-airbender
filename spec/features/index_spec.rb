require 'rails_helper'

RSpec.describe 'When I visit /', type: :feature do
  describe 'and i select fire nation from the select field' do
    it 'and i click search for members i should be on the search page' do
      visit root_path

      select "Fire Nation", from: "nation"
      click_on "Search For Members"

      expect(current_path).to eq(search_path)
    end

    it 'and i should see a list with detailed informnation for the first 25 members of the fire nation' do

    end

    it 'and for each member i hsould see all of their attributes' do

    end
  end
end
