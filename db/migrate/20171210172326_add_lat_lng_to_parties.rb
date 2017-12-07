class AddLatLngToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :lat, :float
    add_column :parties, :lng, :float

    add_index  :parties, [:lat, :lng]
  end
end
