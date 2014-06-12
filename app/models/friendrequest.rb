class Friendrequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :invitation, :class_name => "User"
end
