class Trip < ApplicationRecord
  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def total_distance
    trails.sum(:length)
  end
end
