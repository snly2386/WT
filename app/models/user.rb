class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :friendrequests
  has_many :invitations, :through => :friendrequests
  has_many :inverse_friendrequests, :class_name => "Friendrequest", :foreign_key => "invitee_id"
  has_many :inverse_invitations, :through => :inverse_friendrequests, :source => :user

  has_many :videorequests
  has_many :usertwos, :through => :videorequests
  has_many :inverse_videorequests, :class_name => "Videorequest", :foreign_key => "usertwo_id"
  has_many :inverse_usertwos, :through => :inverse_videorequests, :source => :user

  has_many :videosessions
  has_many :persontwos, :through => :videosessions
  has_many :inverse_videosessions, :class_name => "Videosession", :foreign_key => "persontwo_id"
  has_many :inverse_persontwos, :through => :inverse_videosessions, :source => :user

  has_many :friendships
  has_many :friends, :through => :friendships 
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
