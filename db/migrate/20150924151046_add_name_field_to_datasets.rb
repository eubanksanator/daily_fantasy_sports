class AddNameFieldToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :name, :string
  end
end
