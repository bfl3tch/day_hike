require 'rails_helper'

RSpec.describe 'The trips index page' do
  before(:each) do
    @trip1 = Trip.create!(name: 'summer')
    @trip2 = Trip.create!(name: 'spring break')
    @trip3 = Trip.create!(name: 'thanksgiving break')
    @trip4 = Trip.create!(name: 'winter break')
    @trip5 = Trip.create!(name: '3 day weekend')
    visit '/trips'
  end
  it 'displays a list of all hiking trip names' do
    expect(page).to have_content(@trip1.name)
    expect(page).to have_content(@trip2.name)
    expect(page).to have_content(@trip3.name)
    expect(page).to have_content(@trip4.name)
    expect(page).to have_content(@trip5.name)
  end
end
