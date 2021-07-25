require 'rails_helper'

describe Trip, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :length }
    # it { should validate_presence_of :name }
    # it { should validate_presence_of :address }
    #
    # it { should validate_numericality_of(:length).only_integer }
    # it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe 'associations' do
    it { should have_many(:trail_trips) }
    it { should have_many(:trails).through(:trail_trips)}
  end

  describe 'instance methods' do
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
    end

    describe '#total_distance' do
      it 'calculates the total length from all trails on that trip' do
        expect(@trip1.total_distance).to eq(19)
      end
    end

    describe '#average_distance' do
      it 'calculates the average length from all trails on that trip' do
        expect(@trip1.average_distance).to eq((19/3))
      end
    end

    describe '#longest_trail' do
      it 'determines the longest trail on the trip' do
        expect(@trip1.longest_trail).to eq(@trail3)
      end
    end

    describe '#shortest_trail' do
      it 'determines the shortest trail on the trip' do
        expect(@trip1.shortest_trail).to eq(@trail2)
      end
    end
  end
end
