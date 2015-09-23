class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :salary
      t.float :projected_points
      t.float :price_per_point

      t.timestamps null: false
    end
  end
end
