class CreateCommunityUsers < ActiveRecord::Migration
  def change
    create_table :community_users do |t|
      t.integer :user_id
      t.integer :community_id
      t.boolean :admin

      t.timestamps
    end
  end
end
