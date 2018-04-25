class CreateRouteExperiences < ActiveRecord::Migration
  def change
    create_table :route_experiences do |t|
      t.string :continent_flown_to
      t.text :city_destinations
      t.integer :customer_id

      t.timestamps
    end
  end
end
