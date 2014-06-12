class AddStatusToVideoSession < ActiveRecord::Migration
  def change
    add_column :videosessions, :status, :string
  end
end
