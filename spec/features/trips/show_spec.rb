require 'rails_helper'

RSpec.describe 'The trips show page' do
  before(:each) do
    @trip1 = Trip.create!(name: 'summer')
    @trip2 = Trip.create!(name: 'spring break')
    @trip3 = Trip.create!(name: 'thanksgiving break')
    @trip4 = Trip.create!(name: 'winter break')
    @trip5 = Trip.create!(name: '3 day weekend')
    @trail1 = @trip1.trails.create!(name: 'River Trail', length: 6, address: '123 Front St., Fakecity, WY 00011')
    @trail2 = @trip1.trails.create!(name: 'Ocean Trail', length: 3, address: '456 Ocean Ave., Fakecity, CA 12345')
    @trail3 = @trip1.trails.create!(name: 'Mountain Trail', length: 10, address: '789 Canyon St., Fakecity, WY 00011')
    @trail4 = @trip2.trails.create!(name: 'Fake Trail', length: 6, address: '00 Not St., Fakecity, WY 00011')

    visit "/trips/#{@trip1.id}"
  end

  it 'displays a list of all hiking trip names' do
    expect(page).to have_content(@trip1.name)
    expect(page).to_not have_content(@trip2.name)
  end

  it 'displays all the trails associated to the hiking trip' do
    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail2.length)
    expect(page).to have_content(@trail3.address)
    expect(page).to_not have_content(@trail4.name)
    expect(page).to_not have_content(@trail4.address)
  end
end
