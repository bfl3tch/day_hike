class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
    @trips = @trail.trips
    # @trailtrips = TrailTrip.where(trail: @trail)
    # @trips = @trailtrips.trips
  end
end
