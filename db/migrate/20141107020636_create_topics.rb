class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :category_id
      t.integer :location_id
      t.integer :user_id
      t.string :subject
      t.integer :votes
      t.datetime :expires
      t.text :content
      t.integer :comments_count

      t.timestamps
    end
  end
end
