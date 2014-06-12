class VideorequestsController < ApplicationController
  def create
    @videorequest = current_user.videorequests.build(:usertwo_id => params[:usertwo_id])
    @videorequest.save
    flash[:notice] = "Successfully Sent Video Request"
    redirect_to :controller => "videos", :action => "index", :usertwo_id => params[:usertwo_id]
  end

  def destroy
    @videorequest = current_user.videorequests.find(params[:id])
    @videorequest.destroy
    flash[:notice] = "Removed Video Request"
    redirect_to "/users/#{current_user.id}"
  end
end
