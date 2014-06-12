class CreateFriendrequests < ActiveRecord::Migration
  def change
    create_table :friendrequests do |t|
      t.integer :user_id
      t.integer :invitee_id
      t.timestamps
    end
  end
end
