class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :community
      t.belongs_to :template
      t.string :name

      t.timestamps
    end
  end
end
