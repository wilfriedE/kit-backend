class AddImageUrlToArtifact < ActiveRecord::Migration[5.1]
  def change
    add_column :artifacts, :image_url, :string
  end
end
