require 'opentok'

class VideosessionsController < ApplicationController

  def create
    @videosession = current_user.videosessions.build(:video_id => params[:video_id], :persontwo_id => params[:persontwo_id], :status => "pending")
    @videosession.save
    flash[:videosession] = "Video Request Sent"
    redirect_to "/users/#{current_user.id}"
  end
  def update
    # @videosession.persontwo_id = current_user.id
    @videorequest = Videorequest.find(params[:video_request_id])
    @videorequest.destroy
    @videosession = Videosession.find_by(:user_id => params[:user_id], :persontwo_id => current_user.id)
    @videosession.status = "Video Request Accepted"
    @videosession.save
    flash[:accepted] = "You have accepted a Video Request!"
    redirect_to "/videosessions/#{@videosession.id}"
  end

  def show
    @videosession = Videosession.find(params[:id])
    @video_id = @videosession.video_id
    @video = Video.find(@video_id)
    @youtube_id = @video.youtube_id
    @api_key = ' 44841942'
    @api_secret = 'd8d004b87cbdaf0303aacf6c61aa5ddded15d5b5'
    @opentok_sdk = OpenTok::OpenTok.new @api_key, @api_secret
    @session = @opentok_sdk.create_session
    
    # @opentok_id = @session.session_id
    @opentok_id = @session.session_id
    @token = "T1==cGFydG5lcl9pZD00NDg0MTk0MiZzaWc9NzdlNmQ1OTBiZDNhMjNhNWM1NGFjMTcxMTg2N2FlNzUyYzg0N2NiOTpyb2xlPXN1YnNjcmliZXImc2Vzc2lvbl9pZD0xX01YNDBORGcwTVRrME1uNS1SbkpwSUVwMWJpQXhNeUF3TURvd01UbzFPU0JRUkZRZ01qQXhOSDR3TGpRMU5qazVOVGN6Zm40JmNyZWF0ZV90aW1lPTE0MDI2NDI5ODcmbm9uY2U9MC40NzQ3ODA5MzQwNjExMTg5JmV4cGlyZV90aW1lPTE0MDI2NDU0NjU="
  end

  def destroy
    @videosession = Videosession.find(params[:id])
    @videosession.destroy
    flash[:notice] = "Removed Video Request"
    redirect_to "/users/#{current_user.id}"
  end
end
