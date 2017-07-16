class AddLatitudeAndLongitudeToCommunity < ActiveRecord::Migration[5.1]
  def change
    add_column :communities, :latitude, :float
    add_column :communities, :longitude, :float
  end
end
