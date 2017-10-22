class EventsController < ApplicationController
  
  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
  end

  def new
    @event = Event.new
    @concert = @event.concerts.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Event created'
    else
      flash[:error] = 'Could not create event'
    end
  end

  def update
  end
  
  def destroy
  end

  private
    def event_params
      params.require(:event).permit(:project, :start_date, :end_date, :location, :abo_serie, :season, :concert_id)
    end
end
