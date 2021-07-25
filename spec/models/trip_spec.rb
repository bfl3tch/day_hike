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
end
