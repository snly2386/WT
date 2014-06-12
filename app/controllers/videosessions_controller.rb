class VideosessionsController < ApplicationController

  def create
    @videosession = current_user.videosessions.build(:video_id => params[:video_id], :persontwo_id => params[:persontwo_id], :status => "pending")
    @videosession.save
    flash[:notice] = "Video Request Sent"
    redirect_to "/users/#{current_user.id}"
  end
  def update
    # @videosession.persontwo_id = current_user.id
    @videorequest = Videorequest.find(params[:video_request_id])
    @videorequest.destroy
    @videosession = Videosession.find_by(:user_id => params[:user_id], :persontwo_id => current_user.id)
    @videosession.status = "Video Request Accepted"
    @videosession.save
    redirect_to "/videosessions/#{@videosession.id}"
  end

  def show
    @videosession = Videosession.find(params[:id])
    @video_id = @videosession.video_id
    @video = Video.find(@video_id)
    @youtube_id = @video.youtube_id
  end

  def destroy
    @videosession = Videosession.find(params[:id])
    @videosession.destroy
    flash[:notice] = "Removed Video Request"
    redirect_to "/users/#{current_user.id}"
  end
end
