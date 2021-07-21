class EventsController < ApplicationController
  def game
    @event = Event.find(params[:event_id])
  end
end
