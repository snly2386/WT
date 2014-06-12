class CreateVideosessions < ActiveRecord::Migration
  def change
    create_table :videosessions do |t|
      t.integer :user_id
      t.integer :persontwo_id
      t.string :opentok_key
      t.string :opentok_secret
      t.string :token
      t.timestamps
    end
  end
end
