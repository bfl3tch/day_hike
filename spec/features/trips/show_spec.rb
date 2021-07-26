require 'rails_helper'

RSpec.describe 'The trips show page' do
  before(:each) do
    @trip1 = Trip.create!(name: 'summer')
    @trip2 = Trip.create!(name: 'spring break')
    @trip3 = Trip.create!(name: 'thanksgiving break')
    @trip4 = Trip.create!(name: 'winter break')
    @trip5 = Trip.create!(name: '3 day weekend')
    @trail1 = Trail.create!(name: 'River Trail', length: 6, address: '123 Front St., Fakecity, WY 00011')
    @trail2 = Trail.create!(name: 'Ocean Trail', length: 3, address: '456 Ocean Ave., Fakecity, CA 12345')
    @trail3 = Trail.create!(name: 'Mountain Trail', length: 10, address: '789 Canyon St., Fakecity, WY 00011')
    @trail4 = Trail.create!(name: 'Fake Trail', length: 6, address: '00 Not St., Fakecity, WY 00011')
    @trail_trip1 = TrailTrip.create(trip: @trip1, trail: @trail1)
    @trail_trip2 = TrailTrip.create(trip: @trip1, trail: @trail2)
    @trail_trip3 = TrailTrip.create(trip: @trip1, trail: @trail3)
    @trail_trip4 = TrailTrip.create(trip: @trip2, trail: @trail1)
    @ttrail_trip5 = TrailTrip.create(trip: @trip2, trail: @trail4)

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

  it 'displays the total length of the trip by adding up the length of all associated trails' do
    expect(page).to have_content("Total trip hiking length: 19")
  end

  it 'displays the average length of the trails on the trip' do
    expect(page).to have_content("Average trip hiking length: 6")
  end

  it 'displays the name and length of the longest trail on the trip' do
    expect(page).to have_content("Longest Trail: #{@trail3.name}, with a length of: #{@trail3.length}")
  end

  it 'displays the name and length of the longest trail on the trip' do
    expect(page).to have_content("Shortest Trail: #{@trail2.name}, with a length of: #{@trail2.length}")
  end

  it 'has the name of each trail as a link to that trails show page' do
    expect(page).to have_link(@trail1.name)
    click_link @trail1.name

    expect(current_path).to eq("/trails/#{@trail1.id}")
  end
end
