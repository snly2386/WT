
class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = current_user
  end

  def index
    @users = User.all
  end

  def upload
    current_user.photo = params[:photo].original_filename
    current_user.save
    flash[:upload] = "Successfully Uploaded Image"
    redirect_to "/users/#{current_user.id}"
  end

  
end
