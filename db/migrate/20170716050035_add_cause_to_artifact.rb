class AddCauseToArtifact < ActiveRecord::Migration[5.1]
  def change
    add_reference :artifacts, :cause, foreign_key: true
  end
end
