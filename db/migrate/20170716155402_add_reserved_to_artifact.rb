class AddReservedToArtifact < ActiveRecord::Migration[5.1]
  def change
    add_column :artifacts, :reserved, :boolean
  end
end
