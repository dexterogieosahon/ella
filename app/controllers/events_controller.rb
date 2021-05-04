class EventsController < BaseController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :user_events]

  def index
    render json: EventSerializer.new(Event.all)
  end

  def show
    render json: EventSerializer.new(@event)
  end

  def user_events
    render json: EventSerializer.new(@event)
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

end
