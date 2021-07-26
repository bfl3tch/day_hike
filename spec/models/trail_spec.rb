require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe 'associations' do
    it { should have_many(:trail_trips) }
    it { should have_many(:trips).through(:trail_trips)}
  end

  describe 'instance methods' do
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


    end
    describe '#all_trips_for' do
      it 'shows all the trips that have a specific trail' do
        expect(@trail1.all_trips_for).to eq([@trip1, @trip2])
      end
    end
  end
end
