class CreateTrailTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trail_trips do |t|
      t.references :trip, foreign_key: true
      t.references :trail, foreign_key: true

      t.timestamps
    end
  end
end
