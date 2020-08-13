class ImagesController < ApplicationController
  def create
   @user = User.find(params[:user_id])
   @user.image.attach(params[:image])
   redirect_to(user_path(@user))
  end
end
