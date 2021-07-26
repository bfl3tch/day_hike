require 'rails_helper'

RSpec.describe 'The trails show page' do
  before(:each) do
    @trip1 = Trip.create!(name: 'summer')
    @trip2 = Trip.create!(name: 'spring break')
    @trail1 = Trail.create!(name: 'River Trail', length: 6, address: '123 Front St., Fakecity, WY 00011')
    @trail2 = Trail.create!(name: 'Ocean Trail', length: 3, address: '456 Ocean Ave., Fakecity, CA 12345')
    @trail3 = Trail.create!(name: 'Mountain Trail', length: 10, address: '789 Canyon St., Fakecity, WY 00011')
    @trail4 = Trail.create!(name: 'Fake Trail', length: 6, address: '00 Not St., Fakecity, WY 00011')
    @trail_trip1 = TrailTrip.create!(trip: @trip1, trail: @trail1)
    @trail_trip2 = TrailTrip.create!(trip: @trip1, trail: @trail2)
    @trail_trip3 = TrailTrip.create!(trip: @trip1, trail: @trail3)
    @trail_trip4 = TrailTrip.create!(trip: @trip2, trail: @trail1)
    @trail_trip5 = TrailTrip.create!(trip: @trip2, trail: @trail4)
    visit "/trails/#{@trail1.id}"
  end

  it 'displays all of the trails attributes' do
    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail1.length)
    expect(page).to have_content(@trail1.address)
  end

  it 'displays the name and total length of every hiking trip that included this trail' do
    expect(page).to have_content(@trip1.name)
    expect(page).to have_content(@trip2.name)
    expect(page).to have_content(@trip1.total_distance)
    expect(page).to have_content(@trip2.total_distance)
  end

  it 'displays the total quantity of trips where this trail was included' do
    expect(page).to have_content("Total number of hiking trips this trail was included: 2")

  end
end
