require 'rails_helper'

RSpec.describe Avatar, type: :model do
  before :each do
    @avatar = Avatar.new(
      _id: 1,
      name: 'Andrew',
      photoUrl: 'nothing',
      allies: ['Khoa'],
      enemies: ['FrontEnd Devs'],
      affiliation: 'Airbender?'
    )
  end

  it 'creates an avater with all the given information' do
    expect(@avatar.id).to eq(1)
    expect(@avatar.name).to eq('Andrew')
    expect(@avatar.photo_link).to eq('nothing')
    expect(@avatar.allies).to eq(['Khoa'])
    expect(@avatar.enemies).to eq(['FrontEnd Devs'])
    expect(@avatar.affiliations).to eq('Airbender?')
  end
end
