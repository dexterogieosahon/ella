class EventsController < BaseController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_event, only: [:show]

  def show
    render json: EventSerializer.new(@event)
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

end
