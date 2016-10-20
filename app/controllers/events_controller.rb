class EventsController < ApplicationController
  def index
    @user = User.where(id: session[:id]).first
    user_state = User.where(id: session[:id]).first.state 
    @events = Event.where(state: user_state)
    @other_events = Event.where.not(state:user_state)
    
  end
  def create
   event = Event.create(user_id: session[:id], name: params[:name], date: params[:date], city: params[:city], state: params[:state])
    redirect_to "/events/#{event.id}"
  end

  def show
    @event = Event.where(id: params[:id]).first
    render "show"

  end
  def join
    Join.create(user_id: session[:id], event_id: params[:event_id])
    redirect_to "/events"
  end

  def leave
    @join = Join.where() 
  end 

  def update
  end

  def delete
  end
end
