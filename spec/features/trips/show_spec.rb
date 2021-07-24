require 'rails_helper'

RSpec.describe 'The trips show page' do
  before(:each) do
    @trip1 = Trip.create!(name: 'summer')
    @trip2 = Trip.create!(name: 'spring break')
    @trip3 = Trip.create!(name: 'thanksgiving break')
    @trip4 = Trip.create!(name: 'winter break')
    @trip5 = Trip.create!(name: '3 day weekend')
    visit "/trips/#{@trip1.id}"
  end
  it 'displays a list of all hiking trip names' do
    expect(page).to have_content(@trip1.name)
    expect(page).to_not have_content(@trip2.name)
  end
end
