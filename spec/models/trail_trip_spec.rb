require 'rails_helper'

describe TrailTrip, type: :model do
  describe 'associations' do
    it { should belong_to(:trail) }
    it { should belong_to(:trip) }
  end
end
