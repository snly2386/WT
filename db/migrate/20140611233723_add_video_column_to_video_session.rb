class AddVideoColumnToVideoSession < ActiveRecord::Migration
  def change
    add_column :Videosessions, :video_id, :integer
  end
end
