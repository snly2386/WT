class VideosController < ApplicationController
  def show
    @videos = Video.all

    
  end

  def index
    @videos = Video.all
    @usertwo_id = params[:usertwo_id]
  end
end
