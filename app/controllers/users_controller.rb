class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      #if current_user.id != params[:id]
        #flash[:danger] = "Ce n'est pas la page de votre profile"
      #  redirect_to event_path
    #  end
      @user = User.find(params[:id])
    end
  end

end
