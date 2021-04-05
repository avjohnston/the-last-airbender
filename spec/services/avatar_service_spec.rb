require 'rails_helper'

RSpec.describe AvatarService, type: :model do
  describe 'affilaitions end point' do
    it '#nation_get returns a hash of json data' do
      @avatars = AvatarService.nation_get('Fire Nation')

      expect(@avatars.class).to eq(Array)
      expect(@avatars.first.class).to eq(Hash)
      expect(@avatars.first[:name].class).to eq(String)
      expect(@avatars.first[:allies].class).to eq(Array)
      expect(@avatars.first[:enemies].class).to eq(Array)
      expect(@avatars.first[:affiliation].class).to eq(String)
      expect(@avatars.size).to eq(25)
    end

    it '#all_members_get returns all members not just the first 25' do
      @avatars = AvatarService.all_members_get('Fire Nation')

      expect(@avatars.class).to eq(Array)
      expect(@avatars.first.class).to eq(Hash)
      expect(@avatars.first[:name].class).to eq(String)
      expect(@avatars.first[:allies].class).to eq(Array)
      expect(@avatars.first[:enemies].class).to eq(Array)
      expect(@avatars.first[:affiliation].class).to eq(String)
      expect(@avatars.size).to eq(97)
    end
  end
end
