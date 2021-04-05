require 'rails_helper'

RSpec.describe AvatarsFacade, type: :model do
  before :each do
    @avatar = AvatarsFacade.avatar_objects('Fire Nation').last
  end

  it 'creates an avatar object with the correct information' do
    expect(@avatar.class).to eq(Avatar)
    expect(@avatar.id.class).to eq(String)
    expect(@avatar.name.class).to eq(String)
    expect(@avatar.photo_link.class).to eq(String)
    expect(@avatar.enemies.class).to eq(Array)
    expect(@avatar.enemies.first.class).to eq(String)
    expect(@avatar.allies.class).to eq(Array)
    expect(@avatar.allies.first.class).to eq(String)
    expect(@avatar.affiliations.class).to eq(String)
  end
end
