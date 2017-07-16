class AddImageUrlToArtifactRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :artifact_requests, :image_url, :string
  end
end
