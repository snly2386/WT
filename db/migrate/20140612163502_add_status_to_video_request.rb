class AddStatusToVideoRequest < ActiveRecord::Migration
  def change
    add_column :videorequests, :status, :string
  end
end
