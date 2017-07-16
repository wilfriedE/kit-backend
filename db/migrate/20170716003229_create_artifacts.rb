class CreateArtifacts < ActiveRecord::Migration[5.1]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :condition

      t.timestamps
    end
  end
end
