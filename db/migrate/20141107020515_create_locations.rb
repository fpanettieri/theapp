class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.datetime :expires
      t.string :hours
      t.text :detail

      t.timestamps
    end
  end
end
