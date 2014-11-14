class AddLatLngToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :lat, :float
    add_column :profiles, :lng, :float
  end
end
