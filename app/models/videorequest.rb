class Videorequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :usertwo, :class_name => "User"
end
