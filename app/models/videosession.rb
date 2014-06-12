class Videosession < ActiveRecord::Base
  belongs_to :user
  belongs_to :persontwo, :class_name => "User"
  has_one :video
end

