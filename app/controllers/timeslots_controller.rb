class TimeslotsController < BaseController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_timeslot

  def show
    render json: BookmarkedTimeslotSerializer.new(@timeslot)
  end

  def user_event_timeslot
    render json: TimeslotSerializer.new(@timeslot, { params: { current_user: current_user }})
  end

  private
  def set_timeslot
    @timeslot = Timeslot.where(event_id: params[:event_id], id: params[:id]).first
  end
end
