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
      @fire_nation = AvatarsFacade.avatar_objects('Fire Nation')
      visit root_path

      select "Fire Nation", from: "nation"
      click_on "Search For Members"

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Fire Nation')
      expect(@fire_nation.size).to eq(25)

      within "#avatar-#{@fire_nation.first.id}" do
        expect(page).to have_content('Allies:')
        expect(page).to have_content('Enemies:')
        expect(page).to have_content('Affiliation:')
      end
    end

    it 'and for each member i should see all of their attributes' do
      visit root_path

      select "Fire Nation", from: "nation"
      click_on "Search For Members"

      @fire_nation = AvatarsFacade.avatar_objects('Fire Nation')

      within "#avatar-#{@fire_nation.first.id}" do
        expect(page).to have_content('Chan (Fire Nation admiral)')
        expect(page).to have_content('Ozai')
        expect(page).to have_content('Earth Kingdom')
        expect(page).to have_content('Fire Nation Navy')
      end

      within "#avatar-#{@fire_nation.last.id}" do
        expect(page).to have_content('Fire Nation train conductor')
        expect(page).to have_content('Aang')
        expect(page).to have_content('Combustion Man')
        expect(page).to have_content('Fire Nation Fire Nation train')
      end
    end
  end
end
