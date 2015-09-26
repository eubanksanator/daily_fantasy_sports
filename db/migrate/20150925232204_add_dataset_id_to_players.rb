class AddDatasetIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :dataset_id, :integer
    add_index :players, :dataset_id
  end
end
