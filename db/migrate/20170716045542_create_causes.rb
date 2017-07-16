class CreateCauses < ActiveRecord::Migration[5.1]
  def change
    create_table :causes do |t|
      t.string :name
      t.text :description
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end
