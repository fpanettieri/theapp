class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :category
      t.belongs_to :location
      t.belongs_to :user
      t.string :subject
      t.integer :votes
      t.datetime :expires
      t.text :content
      t.integer :comments_count

      t.timestamps
    end
  end
end
