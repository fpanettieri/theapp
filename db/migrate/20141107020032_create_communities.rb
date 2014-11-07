class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end
  end
end
