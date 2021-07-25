require 'rails_helper'

RSpec.describe 'The trails show page' do
  before(:each) do
    @trip1 = Trip.create!(name: 'summer')
    @trail1 = @trip1.trails.create!(name: 'River Trail', length: 6, address: '123 Front St., Fakecity, WY 00011')

    visit "/trails/#{@trail1.id}"
  end

  it 'displays all of the trails attributes' do
    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail1.length)
    expect(page).to have_content(@trail1.address)
  end
end
