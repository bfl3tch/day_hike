class Trip < ApplicationRecord
  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def total_distance
    trails.sum(:length)
  end

  def average_distance
    trails.average(:length).to_i
  end

  def longest_trail
    trails.order(:length).last
  end
end
