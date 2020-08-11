class EventsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @event = Event.new(title: params[:title], content: params[:content], user_id: current_user.id) # avec xxx qui sont les données obtenues à partir du formulaire

    if @event.save # essaie de sauvegarder en base @gossip
      render "/"# si ça marche, il redirige vers la page d'index du site
    else
      render :new
    end
  end

  
end
