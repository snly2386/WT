class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.save
    @inverse_friendship = Friendship.create(:user_id => params[:friend_id], :friend_id => current_user.id)
    flash[:addfriend] = "Successfully added friendship"
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:removefriend] = "Removed friendship"
    redirect_to "/users/#{current_user.id}"
  end
end
