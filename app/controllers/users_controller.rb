class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @user = User.find(params[:id])
    end
  end

end
