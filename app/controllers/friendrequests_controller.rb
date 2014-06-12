class FriendrequestsController < ApplicationController
   def create
    @friendrequest = current_user.friendrequests.build(:invitee_id => params[:invitee_id])
    @friendrequest.save
    flash[:notice] = "Successfully Sent Friend Request"
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    @friendrequest = current_user.friendrequests.find(params[:id])
    @friendrequest.destroy
    flash[:notice] = "Removed friendrequest"
    redirect_to "/users/#{current_user.id}"
  end
end
