require 'rails_helper'

RSpec.describe 'When I visit /', type: :feature do
  describe 'and i select fire nation from the select field' do
    it 'and i click search for members i should be on the search page' do
      visit root_path

      select "Fire Nation", from: "nation"
      click_on "Search For Members"

      expect(current_path).to eq(search_path)
    end

    it 'and i should see a list with detailed information for the first 25 members of the fire nation' do
      @fire_nation = AvatarService.avatar_objects('Fire Nation')
      visit root_path

      select "Fire Nation", from: "nation"
      click_on "Search For Members"

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Fire Nation')
      expect(@fire_nation.size).to eq(20)

      within "#avatar-#{@fire_nation.first.id}" do
        expect(page).to have_content('Name:')
        expect(page).to have_content('Photo:')
        expect(page).to have_content('Allies:')
        expect(page).to have_content('Enemies:')
        expect(page).to have_content('Affiliation:')
      end
    end

    it 'and for each member i should see all of their attributes' do

    end
  end
end
