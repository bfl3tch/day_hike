class Trail < ApplicationRecord
  validates_presence_of :name, :address, :length
  validates_numericality_of :length, only_integer: true, greater_than: 0
  has_many :trail_trips
  has_many :trips, through: :trail_trips

  def all_trips_for
    Trip.joins(:trails).where("trails.id = #{self.id}")
  end

end
