class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :rankings_filename
      t.string :salaries_filename
      t.string :rankings
      t.string :salaries

      t.timestamps null: false
    end
  end
end
