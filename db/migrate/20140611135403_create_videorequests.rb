class CreateVideorequests < ActiveRecord::Migration
  def change
    create_table :videorequests do |t|
      t.integer :user_id
      t.integer :usertwo_id
      t.timestamps
    end
  end
end
