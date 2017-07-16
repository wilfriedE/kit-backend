class AddApprovedToBid < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :approved, :boolean
  end
end
