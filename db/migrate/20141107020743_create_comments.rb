class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :topic
      t.belongs_to :user
      t.references :parent
      t.integer :votes
      t.text :content

      t.timestamps
    end
  end
end
