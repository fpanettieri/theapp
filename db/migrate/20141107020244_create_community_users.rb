class CreateCommunityUsers < ActiveRecord::Migration
  def change
    create_table :community_users do |t|
      t.belongs_to :user
      t.belongs_to :community
      t.boolean :admin

      t.timestamps
    end
  end
end
