class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end
  end
end
