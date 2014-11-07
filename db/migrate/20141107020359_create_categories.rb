class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :community_id
      t.integer :template_id
      t.string :name

      t.timestamps
    end
  end
end
